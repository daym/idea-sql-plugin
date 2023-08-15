// Copyright 2000-2022 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the COPYING file.
package com.github.daym.ideasqlplugin.settings

import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.components.PersistentStateComponent
import com.intellij.openapi.components.State
import com.intellij.openapi.components.Storage
import com.intellij.util.xmlb.XmlSerializerUtil

@State(
    name = "com.github.daym.ideasqlplugin.settings.ProjectSettingsState",
    storages = [Storage("SqlPlugin.xml")]
)
class ProjectSettingsState : PersistentStateComponent<ProjectSettingsState?> {
    var sqlClientType = "sybase-ase"
    var sqlClientExecutableName = "isql"

    override fun getState(): ProjectSettingsState {
        return this
    }

    override fun loadState(state: ProjectSettingsState) {
        XmlSerializerUtil.copyBean(state, this)
    }

    companion object {
        val instance: ProjectSettingsState
            get() = ApplicationManager.getApplication().getService(
                ProjectSettingsState::class.java
            )
    }
}
