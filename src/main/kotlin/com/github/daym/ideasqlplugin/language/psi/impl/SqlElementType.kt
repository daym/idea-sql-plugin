package com.github.daym.ideasqlplugin.language.psi.impl

import com.github.daym.ideasqlplugin.SqlLanguage
import com.intellij.lang.Language
import org.jetbrains.annotations.NonNls

class SqlElementType(debugName: @NonNls String) :
    com.intellij.psi.tree.IElementType(debugName, SqlLanguage.INSTANCE) {
}
