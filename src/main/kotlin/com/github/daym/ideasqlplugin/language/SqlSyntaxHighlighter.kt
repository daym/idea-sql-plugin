import com.intellij.psi.tree.TokenSet
import com.github.daym.ideasqlplugin.language.psi.SqlTypes.*;
import com.github.daym.ideasqlplugin.parser.SqlFlexAdapter
import com.intellij.lexer.Lexer
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors
import com.intellij.openapi.editor.HighlighterColors
import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase
import com.intellij.openapi.fileTypes.SyntaxHighlighterFactory
import com.intellij.openapi.fileTypes.SyntaxHighlighterProvider
import com.intellij.openapi.project.Project
import com.intellij.openapi.vfs.VirtualFile
import com.intellij.psi.TokenType
import com.intellij.psi.tree.IElementType

// TODO: ISNULL INDEX OFFSET TEMP
val KEYWORDS = TokenSet.create(
    ACTION, ADD, AFTER, ALL, ALTER, AND, AS, ASC, /* FIXME AUTOINCREMENT,*/ BEFORE, BEGIN, BETWEEN, BY, CASCADE, CASE, CAST,
    CHECK, COLLATE, COLUMN, COMMIT, CONSTRAINT, CREATE, CROSS, DEFAULT, DEFERRABLE, DEFERRED, DELETE, DESC,
    DISTINCT, DROP, EACH, ELSE, END, ESCAPE, EXCEPT, EXISTS, FALSE, FOR, FOREIGN, FROM, FULL, GROUP, HAVING,
    IF, IMMEDIATE, IN, INITIALLY, INNER, INSERT, INTERSECT, INTO, IS, JOIN, KEY, LEFT, LIKE,
    MATCH, NATURAL, NO, NOT, NULL, OF, ON, OR, ORDER, OUTER, PRIMARY, RECURSIVE, REFERENCES,
    RELEASE, RESTRICT, RIGHT, ROLLBACK, ROW, SAVEPOINT, SELECT, SET, TABLE, TEMPORARY, THEN,
    TO, TRANSACTION, TRIGGER, TRUE, UNION, UNIQUE, UPDATE, USING, VALUES, VIEW, WHEN, WHERE, WITH, WITHOUT,
    GO, // FIXME Sybase
)
val OPERATORS =
    TokenSet.create(AMP, BAR, CONCAT, DIV, EQ, EQEQ, GT, GTE, LT, LTE, MINUS, MOD, NOT_EQ, PLUS, SHL, SHR, STAR, TILDE, UNEQ)
val IDENTIFIERS = TokenSet.create(
    IDENTIFIER,
    /*FIXME BRACKET_LITERAL,
    BACKTICK_LITERAL,
    UNTERMINATED_BRACKET_LITERAL,
    UNTERMINATED_BACKTICK_LITERAL */
)
val STRING_LITERALS = TokenSet.create(
    /*SINGLE_QUOTE_STRING_LITERAL,
    DOUBLE_QUOTE_STRING_LITERAL,
    UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL,
    UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL*/
    CHARACTER_STRING_LITERAL,
    BINARY_STRING_LITERAL,
    BIT_STRING_LITERAL,
    HEX_STRING_LITERAL,
    NATIONAL_CHARACTER_STRING_LITERAL,
)
val WHITE_SPACES = TokenSet.create(TokenType.WHITE_SPACE)
val COMMENTS = TokenSet.create(COMMENT, LINE_COMMENT)
val CONSTANTS = TokenSet.create(CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP)
private enum class SqlTextAttributes(fallback: TextAttributesKey) {
    BAD_CHARACTER(HighlighterColors.BAD_CHARACTER),
    KEYWORD(DefaultLanguageHighlighterColors.KEYWORD),
    NUMBER(DefaultLanguageHighlighterColors.NUMBER),
    PARAMETER(DefaultLanguageHighlighterColors.INSTANCE_FIELD),
    STRING(DefaultLanguageHighlighterColors.STRING),
    BLOCK_COMMENT(DefaultLanguageHighlighterColors.BLOCK_COMMENT),
    LINE_COMMENT(DefaultLanguageHighlighterColors.LINE_COMMENT),
    OPERATOR(DefaultLanguageHighlighterColors.OPERATION_SIGN),
    PARENTHESES(DefaultLanguageHighlighterColors.PARENTHESES),
    DOT(DefaultLanguageHighlighterColors.DOT),
    COMMA(DefaultLanguageHighlighterColors.COMMA),
    SEMICOLON(DefaultLanguageHighlighterColors.SEMICOLON),
    CONSTANT(DefaultLanguageHighlighterColors.CONSTANT),
    IDENTIFIER(DefaultLanguageHighlighterColors.IDENTIFIER),
    ;
    val key = TextAttributesKey.createTextAttributesKey("ANDROID_SQL_$name", fallback)
    val keys = arrayOf(key)
}
private val EMPTY_KEYS = emptyArray<TextAttributesKey>()
class SqlSyntaxHighlighter : SyntaxHighlighterBase() {
    override fun getHighlightingLexer(): Lexer = SqlFlexAdapter()
    override fun getTokenHighlights(tokenType: IElementType?): Array<TextAttributesKey> = when (tokenType) {
        in KEYWORDS -> SqlTextAttributes.KEYWORD.keys
        in OPERATORS -> SqlTextAttributes.OPERATOR.keys
        in CONSTANTS -> SqlTextAttributes.CONSTANT.keys
        in STRING_LITERALS -> SqlTextAttributes.STRING.keys
        in IDENTIFIERS -> SqlTextAttributes.IDENTIFIER.keys
        NUMERIC_LITERAL -> SqlTextAttributes.NUMBER.keys
        // FIXME NAMED_PARAMETER -> SqlTextAttributes.PARAMETER.keys
        // FIXME NUMBERED_PARAMETER -> SqlTextAttributes.NUMBER.keys
        LINE_COMMENT -> SqlTextAttributes.LINE_COMMENT.keys
        COMMENT -> SqlTextAttributes.BLOCK_COMMENT.keys
        LPAREN, RPAREN -> SqlTextAttributes.PARENTHESES.keys
        DOT -> SqlTextAttributes.DOT.keys
        COMMA -> SqlTextAttributes.COMMA.keys
        SEMICOLON -> SqlTextAttributes.SEMICOLON.keys
        TokenType.BAD_CHARACTER -> SqlTextAttributes.BAD_CHARACTER.keys
        else -> EMPTY_KEYS
    }
}
