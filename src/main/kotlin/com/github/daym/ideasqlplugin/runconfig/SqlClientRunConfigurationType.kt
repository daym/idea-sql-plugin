package com.github.daym.ideasqlplugin.runconfig

import com.intellij.execution.configurations.ConfigurationTypeBase
import com.intellij.icons.AllIcons
import com.intellij.openapi.util.NotNullLazyValue

class SqlClientRunConfigurationType(): ConfigurationTypeBase(ID, "Sql Client", "Sql Client run configuration type", NotNullLazyValue.createValue { AllIcons.Nodes.Console }) {
    init {
        addFactory(SqlClientConfigurationFactory(this))
    }

    companion object {
        const val ID: String = "SqlRunConfiguration"
    }
}