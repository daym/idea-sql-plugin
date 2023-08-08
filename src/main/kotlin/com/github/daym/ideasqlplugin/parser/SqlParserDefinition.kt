package com.github.daym.ideasqlplugin.parser

import com.github.daym.ideasqlplugin.language.parser.SqlParser
import com.github.daym.ideasqlplugin.language.psi.SqlTypes
import com.github.daym.ideasqlplugin.stubs.types.SqlFileElementType
import com.intellij.lang.ASTNode
import com.intellij.lang.ParserDefinition
import com.intellij.lang.PsiParser
import com.intellij.lexer.Lexer
import com.intellij.openapi.project.Project
import com.intellij.psi.FileViewProvider
import com.intellij.psi.PsiElement
import com.intellij.psi.PsiFile
import com.intellij.psi.TokenType
import com.intellij.psi.tree.IFileElementType
import com.intellij.psi.tree.TokenSet

class SqlParserDefinition : ParserDefinition {
    companion object {
        @JvmStatic
        val STRINGS = TokenSet.create(SqlTypes.CHARACTER_STRING_LITERAL, SqlTypes.BIT_STRING_LITERAL, SqlTypes.BINARY_STRING_LITERAL, SqlTypes.HEX_STRING_LITERAL, SqlTypes.NATIONAL_CHARACTER_STRING_LITERAL)

        @JvmStatic
        val WHITESPACES = TokenSet.create(TokenType.WHITE_SPACE)

    }
    override fun createLexer(project: Project): Lexer {
        return SqlFlexAdapter()
    }

    override fun createParser(project: Project): PsiParser {
        return SqlParser()
    }

    override fun getFileNodeType(): IFileElementType {
        return SqlFileElementType.INSTANCE
    }

    override fun getCommentTokens(): TokenSet {
        return TokenSet.create(SqlTypes.COMMENT) // TODO: more
    }

    override fun getStringLiteralElements(): TokenSet {
        return STRINGS
    }

    override fun createElement(node: ASTNode): PsiElement {
        return SqlTypes.Factory.createElement(node)
    }

    override fun createFile(viewProvider: FileViewProvider): PsiFile {
        return SqlFile(viewProvider)
    }

    // FIXME remove?
    override fun getWhitespaceTokens(): TokenSet {
        return WHITESPACES
    }

    override fun spaceExistenceTypeBetweenTokens(left: ASTNode?, right: ASTNode?) = ParserDefinition.SpaceRequirements.MAY
}
