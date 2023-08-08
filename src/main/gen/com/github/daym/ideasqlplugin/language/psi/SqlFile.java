package com.github.daym.ideasqlplugin.language.psi;

import com.github.daym.ideasqlplugin.SqlFileType;
import com.github.daym.ideasqlplugin.SqlLanguage;
import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import com.intellij.psi.PsiFile;
import org.jetbrains.annotations.NotNull;

public class SqlFile extends PsiFileBase {
    @Override
    public @NotNull FileType getFileType() {
        return SqlFileType.getINSTANCE();
    }

    @Override
    public String toString() {
        return "SqlFile";
    }

    public SqlFile(@NotNull FileViewProvider viewProvider) {
        super(viewProvider, SqlLanguage.getINSTANCE());
    }
}
