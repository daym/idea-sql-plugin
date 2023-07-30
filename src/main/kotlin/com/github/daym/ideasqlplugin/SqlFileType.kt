package com.github.daym.ideasqlplugin

import com.intellij.openapi.fileTypes.LanguageFileType
import com.intellij.openapi.util.NlsContexts
import com.intellij.openapi.util.NlsSafe
import icons.SqlIcons
import org.jetbrains.annotations.NonNls
import javax.swing.Icon

class SqlFileType : LanguageFileType(SqlLanguage.INSTANCE) {
    override fun getName(): @NonNls String {
        return "SQL File"
    }

    override fun getDescription(): @NlsContexts.Label String {
        return "SQL file"
    }

    override fun getDefaultExtension(): @NlsSafe String {
        return "sql"
    }

    override fun getIcon(): Icon {
        return SqlIcons.MyIcons.SqlFile
    }

    companion object {
        @JvmStatic
        val INSTANCE = SqlFileType()
    }
}
