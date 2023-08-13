package com.github.daym.ideasqlplugin.runconfig

import com.intellij.execution.configurations.ConfigurationFactory
import com.intellij.execution.configurations.ConfigurationType
import com.intellij.execution.configurations.RunConfiguration
import com.intellij.openapi.components.BaseState
import com.intellij.openapi.project.Project
import kotlin.reflect.KClass

class SqlClientConfigurationFactory(typ: ConfigurationType) : ConfigurationFactory(typ) {
    override fun createTemplateConfiguration(project: Project): RunConfiguration {
        return SqlClientRunConfiguration(project, this, "Sql")
    }

    override fun getId(): String {
        return SqlClientRunConfigurationType.ID;
    }

    override fun getOptionsClass(): Class<out BaseState> {
        return SqlClientRunConfigurationOptions::class.java
    }
}
