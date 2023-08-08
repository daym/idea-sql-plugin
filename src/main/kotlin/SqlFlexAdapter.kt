package com.github.pyltsin.monkeyplugin.lexer

import com.github.daym.ideasqlplugin._SqlLexer
import com.intellij.lexer.FlexAdapter

class SqlFlexAdapter : FlexAdapter(_SqlLexer(null))