package com.github.daym.ideasqlplugin.action

import com.intellij.openapi.actionSystem.ActionUpdateThread
import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.application.ReadAction
import com.intellij.openapi.editor.Document
import com.intellij.openapi.editor.Editor
import com.intellij.openapi.fileEditor.FileDocumentManager
import com.intellij.openapi.fileTypes.FileTypeManager
import com.intellij.openapi.project.Project
import com.intellij.openapi.util.Condition
import com.intellij.openapi.util.text.StringUtil
import com.intellij.openapi.vcs.changes.ChangeListManager
import com.intellij.openapi.vfs.VirtualFile
import com.intellij.util.containers.ContainerUtil
import com.intellij.util.containers.toArray
import java.io.IOException

class SchemaPuttingAction: AnAction() {
    private val FILE_WITH_CONTENT: Condition<VirtualFile> =
        Condition<VirtualFile> { f -> f != null && !f.fileType.isBinary }

    private fun filterFilesWithContent(files: Array<VirtualFile>?): Array<VirtualFile?>? {
        return if (files == null) null else ContainerUtil.filter(files, FILE_WITH_CONTENT)
            .toArray(VirtualFile.EMPTY_ARRAY)
    }

    override fun update(e: AnActionEvent) {
        val project: Project? = e.getData(CommonDataKeys.PROJECT)
        if (project == null || project.isDefault) {
            e.presentation.isEnabledAndVisible = false
            return
        }
        val editor: Editor? = e.getData(CommonDataKeys.EDITOR)
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE)
        val files = e.getData(CommonDataKeys.VIRTUAL_FILE_ARRAY)
        val hasFilesWithContent = FILE_WITH_CONTENT.value(file) || files != null && ContainerUtil.exists<VirtualFile>(
            files,
            FILE_WITH_CONTENT
        )

        if (!hasFilesWithContent || editor != null && editor.document.textLength == 0) {
            e.presentation.isEnabledAndVisible = false
            return
        }
        e.presentation.isEnabledAndVisible = true
    }

    private fun getContentFromEditor(editor: Editor): String? {
        var text = ReadAction.compute<String?, RuntimeException> {
            editor.selectionModel.getSelectedText(true)
        }
        if (text == null) {
            text = editor.document.text
        }
        return if (StringUtil.isEmptyOrSpaces(text)) {
            null
        } else text
    }
    private fun isFileIgnored(file: VirtualFile, project: Project): Boolean {
        val manager = ChangeListManager.getInstance(project)
        return manager.isIgnoredFile(file) || FileTypeManager.getInstance().isFileIgnored(file)
    }

    private fun addPrefix(name: String, prefix: String?, addTrailingSlash: Boolean): String {
        var pref = prefix ?: ""
        pref += name
        if (addTrailingSlash) {
            pref += "_"
        }
        return pref
    }

    private fun getContentFromDirectory(
        dir: VirtualFile,
        project: Project,
        prefix: String?
    ): List<FileContent> {
        val contents: MutableList<FileContent> = ArrayList()
        for (file in dir.children) {
            if (!isFileIgnored(file, project)) {
                val pref: String = addPrefix(dir.name, prefix, true)
                contents.addAll(getContentFromFile(file, project, pref))
            }
        }
        return contents
    }

    private fun getContentFromFile(
        file: VirtualFile,
        project: Project,
        prefix: String?
    ): List<FileContent> {
        if (file.isDirectory) {
            return getContentFromDirectory(file, project, prefix)
        }
        if (file.fileType.isBinary) {
            // TODO: Show warning
            return emptyList<FileContent>()
        }
        val content: String? = ReadAction.compute<String, java.lang.RuntimeException> {
            try {
                val document: Document? =
                    FileDocumentManager.getInstance().getDocument(file)
                document?.text ?: String(file.contentsToByteArray(), file.charset)
            } catch (e: IOException) {
                //LOG.info("Couldn't read contents of the file $file", e)
                throw e
            }
        }
        if (content == null) {
            // TODO error
            return emptyList<FileContent>()
        }
        if (StringUtil.isEmptyOrSpaces(content)) {
            return emptyList<FileContent>()
        }
        val filename: String = addPrefix(file.name, prefix, false)
        return listOf<FileContent>(FileContent(filename, content))
    }

    private fun collectContents(
        project: Project,
        editor: Editor?,
        file: VirtualFile?,
        files: Array<VirtualFile?>?
    ): List<FileContent> {
        if (editor != null) {
            val content: String = getContentFromEditor(editor) ?: return emptyList<FileContent>()
            return if (file != null) {
                listOf<FileContent>(FileContent(file.name, content))
            } else {
                listOf<FileContent>(FileContent("", content))
            }
        }
        if (files != null) {
            val contents: MutableList<FileContent> = ArrayList<FileContent>()
            for (vf in files) {
                contents.addAll(getContentFromFile(vf!!, project, null))
            }
            return contents
        }
        if (file != null) {
            return getContentFromFile(file, project, null)
        }
        //LOG.error("File, files and editor can't be null all at once!")
        throw IllegalStateException("File, files and editor can't be null all at once!")
    }

    override fun actionPerformed(e: AnActionEvent) {
        val project = e.getData(CommonDataKeys.PROJECT)
        if (project == null || project.isDefault) {
            return
        }

        val editor = e.getData(CommonDataKeys.EDITOR)
        val file = e.getData(CommonDataKeys.VIRTUAL_FILE)
        val files = e.getData(CommonDataKeys.VIRTUAL_FILE_ARRAY)
        if (editor == null && file == null && files == null) {
            return
        }
        val fileContents = collectContents(
            project,
            editor,
            if (FILE_WITH_CONTENT.value(file)) file else null,
            filterFilesWithContent(files)
        )

        // FIXME: putSchemaAction(fileContents) that creates and reuses a Run Configuration ?
    }

    override fun getActionUpdateThread(): ActionUpdateThread {
        return ActionUpdateThread.OLD_EDT
    }
}