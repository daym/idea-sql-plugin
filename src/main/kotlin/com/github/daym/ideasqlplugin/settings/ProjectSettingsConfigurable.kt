// Copyright 2000-2022 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the COPYING file.
package com.github.daym.ideasqlplugin.settings

import com.intellij.openapi.options.Configurable
import org.jetbrains.annotations.Nls
import javax.swing.JComponent

class ProjectSettingsConfigurable : Configurable {
    private var mySettingsComponent: ProjectSettingsComponent? = null
    override fun getDisplayName(): @Nls(capitalization = Nls.Capitalization.Title) String? {
        return "Sql Client"
    }

    override fun getPreferredFocusedComponent(): JComponent? {
        return mySettingsComponent!!.preferredFocusedComponent
    }

    override fun createComponent(): JComponent? {
        mySettingsComponent = ProjectSettingsComponent()
        return mySettingsComponent!!.panel
    }

    override fun isModified(): Boolean {
        val settings: ProjectSettingsState = ProjectSettingsState.instance
        var modified = false
        modified = modified or (mySettingsComponent!!.sqlClientTypeText != settings.sqlClientType)
        modified = modified or (mySettingsComponent!!.sqlClientExecutableNameText != settings.sqlClientExecutableName)
        modified = modified or (mySettingsComponent!!.targetHostText != settings.targetHostName)
        //        modified |= mySettingsComponent.getIdeaUserStatus() != settings.ideaStatus;
        return modified
    }

    override fun apply() {
        val settings: ProjectSettingsState = ProjectSettingsState.instance
        settings.sqlClientType = mySettingsComponent!!.sqlClientTypeText
        settings.sqlClientExecutableName = mySettingsComponent!!.sqlClientExecutableNameText
        settings.targetHostName = mySettingsComponent!!.targetHostText
    }

    override fun reset() {
        val settings: ProjectSettingsState = ProjectSettingsState.instance
        mySettingsComponent!!.sqlClientTypeText = settings.sqlClientType
        mySettingsComponent!!.sqlClientExecutableNameText = settings.sqlClientExecutableName
        mySettingsComponent!!.targetHostText = settings.targetHostName
    }

    override fun disposeUIResources() {
        mySettingsComponent = null
    }
}
