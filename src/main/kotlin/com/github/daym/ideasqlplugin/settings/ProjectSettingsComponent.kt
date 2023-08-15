// Copyright 2000-2022 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the COPYING file.
package com.github.daym.ideasqlplugin.settings

import com.intellij.openapi.fileChooser.FileChooserDescriptor
import com.intellij.openapi.ui.ComboBox
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.ui.components.JBLabel
import com.intellij.util.ui.FormBuilder
import javax.swing.JComponent
import javax.swing.JPanel

class ProjectSettingsComponent {
    private val myMainPanel: JPanel
    private val mySqlClientExecutable: TextFieldWithBrowseButton
    private val myTargetHost: TextFieldWithBrowseButton
    private val mySqlClientType: ComboBox<String>
    val preferredFocusedComponent: JComponent
        //  private final JBTextField myUserNameText = new JBTextField();
        get() = mySqlClientExecutable
    val panel: JComponent
        get() = myMainPanel

    init {
        mySqlClientExecutable = TextFieldWithBrowseButton()
        mySqlClientExecutable.addBrowseFolderListener(
            "SQL Client Executable",
            "The SQL Client executable",
            null,
            FileChooserDescriptor(true, false, false, false, false, false)
        )
        myTargetHost = TextFieldWithBrowseButton()
        /* nope. myTargetHost.addBrowseFolderListener(
            "SQL sysroot", "The source directory (corresponding to the target) on the host", null,
            FileChooserDescriptor(false, true, false, false, false, false)
        ) */

        mySqlClientType = ComboBox(arrayOf("sybase-ase", "postgres", "mssql", "sybase-ase or mssql via freetds"))
        mySqlClientType.addActionListener {
            mySqlClientExecutable.text = if ((mySqlClientType.selectedItem as String) == "postgres") {
                "psql"
            } else if ((mySqlClientType.selectedItem as String) == "sybase-ase or mssql via freetds") {
                "fisql"
            } else {
                "isql"
            }
        }
        myMainPanel = FormBuilder.createFormBuilder()
            .addLabeledComponent(JBLabel("SQL Client type: "), mySqlClientType, 1, false)
            .addLabeledComponent(JBLabel("SQL Client executable: "), mySqlClientExecutable, 1, false)
            .panel
    }

    var sqlClientExecutableNameText: String
        get() = mySqlClientExecutable.text
        set(value) {
            mySqlClientExecutable.text = value
        }

    var sqlClientTypeText: String
        get() = mySqlClientType.selectedItem as String
        set(value) {
            mySqlClientType.selectedItem = value
        }
}
