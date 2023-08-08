package com.github.daym.ideasqlplugin.language.psi.impl

import com.github.daym.ideasqlplugin.SqlLanguage
import com.intellij.psi.tree.IElementType

open class SqlTokenType(debugName: String) : IElementType(debugName, SqlLanguage.INSTANCE)
