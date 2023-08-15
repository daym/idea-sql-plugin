package com.github.daym.ideasqlplugin.runconfig

import com.github.daym.ideasqlplugin.runconfig.SqlClientRunConfigurationType.Companion.getInstance
import com.intellij.execution.actions.ConfigurationContext
import com.intellij.execution.actions.LazyRunConfigurationProducer
import com.intellij.execution.configurations.ConfigurationFactory
import com.intellij.openapi.util.Ref
import com.intellij.psi.PsiElement

class SqlClientRunConfigurationProducer : LazyRunConfigurationProducer<SqlClientRunConfiguration>() {
    /*public SqlClientRunConfigurationProducer() {
        super();
    }*/
    override fun getConfigurationFactory(): ConfigurationFactory {
        return getInstance().factory
    }

    override fun isConfigurationFromContext(
        configuration: SqlClientRunConfiguration,
        context: ConfigurationContext
    ): Boolean {
        return true
    }

    override fun setupConfigurationFromContext(
        configuration: SqlClientRunConfiguration,
        context: ConfigurationContext,
        sourceElement: Ref<PsiElement>
    ): Boolean {
        configuration.setUserName("X")
        return true
    }
}
