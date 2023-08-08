package com.github.daym.ideasqlplugin.parser

import com.github.daym.ideasqlplugin.SqlFileType
import com.github.daym.ideasqlplugin.SqlLanguage
import com.intellij.extapi.psi.PsiFileBase
import com.intellij.openapi.fileTypes.FileType
import com.intellij.psi.FileViewProvider

class SqlFile(viewProvider: FileViewProvider) : PsiFileBase(viewProvider, SqlLanguage.INSTANCE) {
    override fun getFileType(): FileType {
        return SqlFileType.INSTANCE
    }
}