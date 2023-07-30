package com.github.daym.ideasqlplugin

import com.intellij.lang.Language

class SqlLanguage : Language("Sql") {
    companion object {
        @JvmStatic
        val INSTANCE = SqlLanguage()
    }
}
