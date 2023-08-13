package com.github.daym.ideasqlplugin.runconfig

import com.intellij.openapi.fileChooser.FileChooserDescriptorFactory
import com.intellij.openapi.options.SettingsEditor
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.util.ui.FormBuilder
import javax.swing.JComponent
import javax.swing.JPanel

class SqlClientSettingsEditor() : SettingsEditor<SqlClientRunConfiguration>() {
    private var myPanel: JPanel
    private var scriptPathField: TextFieldWithBrowseButton = TextFieldWithBrowseButton()

    init {
        scriptPathField.addBrowseFolderListener(
            "Select Script File", null, null,
            FileChooserDescriptorFactory.createSingleFileDescriptor()
        )
        myPanel = FormBuilder.createFormBuilder()
            .addLabeledComponent("Script file", scriptPathField)
            .panel
    }

    override fun resetEditorFrom(config: SqlClientRunConfiguration) {
        // FIXME TODO("Not yet implemented")
    }

    override fun applyEditorTo(config: SqlClientRunConfiguration) {
        config.setUserName(scriptPathField.text)
    }

    override fun createEditor(): JComponent {
        return myPanel
    }
}
