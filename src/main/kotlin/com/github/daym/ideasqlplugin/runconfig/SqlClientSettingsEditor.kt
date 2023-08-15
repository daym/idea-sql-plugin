package com.github.daym.ideasqlplugin.runconfig

import com.intellij.openapi.fileChooser.FileChooserDescriptorFactory
import com.intellij.openapi.options.SettingsEditor
import com.intellij.openapi.ui.TextFieldWithBrowseButton
import com.intellij.util.ui.FormBuilder
import javax.swing.JComponent
import javax.swing.JPanel

class SqlClientSettingsEditor() : SettingsEditor<SqlClientRunConfiguration>() {
    private var myPanel: JPanel
    private var usernameField: TextFieldWithBrowseButton = TextFieldWithBrowseButton()
    private var targetHostNameField: TextFieldWithBrowseButton = TextFieldWithBrowseButton()

    init {
//        scriptPathField.addBrowseFolderListener(
//            "Select Script File", null, null,
//            FileChooserDescriptorFactory.createSingleFileDescriptor()
//        )
        myPanel = FormBuilder.createFormBuilder()
            .addLabeledComponent("Target host", targetHostNameField)
            .addLabeledComponent("User", usernameField)
            .panel
    }

    override fun resetEditorFrom(config: SqlClientRunConfiguration) {
        targetHostNameField.text = config.getHostName();
        usernameField.text = config.getUserName();
        // FIXME TODO("Not yet implemented")
    }

    override fun applyEditorTo(config: SqlClientRunConfiguration) {
        config.setHostName(targetHostNameField.text)
        config.setUserName(usernameField.text)
    }

    override fun createEditor(): JComponent {
        return myPanel
    }
}
