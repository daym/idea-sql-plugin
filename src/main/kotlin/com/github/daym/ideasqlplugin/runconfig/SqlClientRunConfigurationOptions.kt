package com.github.daym.ideasqlplugin.runconfig

import com.intellij.execution.configurations.RunConfigurationOptions
import com.intellij.openapi.components.StoredProperty

class SqlClientRunConfigurationOptions: RunConfigurationOptions() {
    private val myUserName: StoredProperty<String?> = string("postgres").provideDelegate(this, "userName")

    private val myHostName: StoredProperty<String?> = string("localhost").provideDelegate(this, "hostName")

    fun getUserName(): String? {
        return myUserName.getValue(this)
    }

    fun setUserName(scriptName: String) {
        myUserName.setValue(this, scriptName)
    }

    fun getHostName(): String? {
        return myHostName.getValue(this)
    }
}
