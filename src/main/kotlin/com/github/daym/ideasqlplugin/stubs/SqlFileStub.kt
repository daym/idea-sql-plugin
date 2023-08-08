package com.github.daym.ideasqlplugin.stubs

import com.github.daym.ideasqlplugin.parser.SqlFile
import com.intellij.psi.stubs.PsiFileStubImpl

class SqlFileStub(file: SqlFile?) : PsiFileStubImpl<SqlFile>(file)
