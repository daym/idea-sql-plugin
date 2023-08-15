package com.github.daym.ideasqlplugin.runconfig

import com.github.daym.ideasqlplugin.settings.ProjectSettingsState
import com.intellij.execution.Executor
import com.intellij.execution.configurations.*
import com.intellij.execution.impl.RunnerAndConfigurationSettingsImpl
import com.intellij.execution.process.ProcessHandler
import com.intellij.execution.process.ProcessHandlerFactory
import com.intellij.execution.process.ProcessTerminatedListener
import com.intellij.execution.runners.ExecutionEnvironment
import com.intellij.openapi.options.SettingsEditor
import com.intellij.openapi.project.Project
import com.intellij.openapi.vfs.VfsUtil

class SqlClientRunConfiguration(project: Project, sqlConfigurationFactory: SqlClientConfigurationFactory, name: String) :
    LocatableConfigurationBase<SqlClientRunConfigurationOptions>(project, sqlConfigurationFactory, name) {
    override fun getState(executor: Executor, environment: ExecutionEnvironment): RunProfileState {
        return object : CommandLineState(environment) {
            //@Throws(ExecutionException::class)
            override fun startProcess(): ProcessHandler {
                // TODO: Use ProjectFileIndex.getInstance(project).iterateContent(iterator) to iterate over modules
                // TODO: use {@code ProjectFileIndex.getInstance(project).iterateContent(iterator)} to iterate over all file.
                // TODO: guessProjectDir
                val baseDir = project.baseDir
                // VfsUtil.loadText(VirtualFile file) -> String
                // VfsUtil.iterateChildrenRecursively(VirtualFile(base), null)

                val runnerAndConfigurationSettings = environment.runnerAndConfigurationSettings
                // FIXME this is awful.
                val currentFilePath = (runnerAndConfigurationSettings as? RunnerAndConfigurationSettingsImpl)?.filePathIfRunningCurrentFile

                val files =
                    arrayOf(currentFilePath!!) // ListVfsUtil.collectChildrenRecursively(baseDir).filter { f -> f.extension == "sql" }
                println(files)

                val args = if (ProjectSettingsState.instance.sqlClientType == "postgres") {
                    val args = mutableListOf(ProjectSettingsState.instance.sqlClientExecutableName, "-h", options.getHostName(),
                        "-U", options.getUserName(),
                        "-W")
                    // TODO: --html --expanded --quiet --single-step
                    for (file in files) {
                        args.add("-f")
                        args.add(file) // .path)
                    }
                    args
                } else {
                    // TODO: -R remote_server_principal
                    // TODO: -V security option
                    // TODO: -Z security mechanism
                    // TODO: -M labelname labelvalue; security label
                    // TODO: -z localename
                    // TODO: -Y chained transactions
                    // TODO: -Q HAFAILOVER
                    // TODO: -F FIPS flagger
                    // TODO: -E editor
                    val args = mutableListOf(ProjectSettingsState.instance.sqlClientExecutableName,
                        "-w", "2000",
                        "-S", options.getHostName(),
                        "-U", options.getUserName(),
                        "-s", "|")
                    if (ProjectSettingsState.instance.sqlClientType.indexOf("freetds") == -1) {
                        args.add("--retserverror")
                        args.add("-J");
                        args.add("utf-8");
                        // TODO: also "-a utf-8"
                    }

                    // FIXME: I think isql cannot do more than one file at once
                    for (file in files) {
                        args.add("-i")
                        args.add(file)
                    }
                    args
                }
                println(args)
                val commandLine = GeneralCommandLine(args)
                val processHandler = ProcessHandlerFactory.getInstance()
                    .createColoredProcessHandler(commandLine)
                //processHandler.processInput.write()
                ProcessTerminatedListener.attach(processHandler)
                return processHandler
            }
        }
    }

    override fun getOptions(): SqlClientRunConfigurationOptions {
        return super.getOptions() as SqlClientRunConfigurationOptions
    }

    override fun getConfigurationEditor(): SettingsEditor<out RunConfiguration> {
        return SqlClientSettingsEditor()
    }

    fun setUserName(value: String) {
        options.setUserName(value)
    }

    fun setHostName(text: String) {
        options.setHostName(text)
    }

    fun getUserName(): String {
        return options.getUserName().orEmpty() // FIXME
    }

    fun getHostName(): String {
        return options.getHostName().orEmpty() // FIXME
    }

}
