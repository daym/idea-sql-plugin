package com.github.daym.ideasqlplugin;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.intellij.psi.TokenType.WHITE_SPACE;
import static com.github.daym.ideasqlplugin.language.psi.SqlTypes.*;

%%

%{
  public _SqlLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _SqlLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode
%caseless

EOL=\R
WHITE_SPACE=\s+

IDENTIFIER_BODY=[:letter:][a-zA-Z_0-9]*
NUMERIC_LITERAL=(([0-9]+(\.[0-9]*)?|\.[0-9]+)(E(\+|-)?[0-9]+)?)|(0x[0-9a-f]+)
SINGLE_QUOTE_STRING_LITERAL=X?'(''|[^'])*'
DOUBLE_QUOTE_STRING_LITERAL=X?\"(\"\"|[^\"])*\"
ADA_HOST_IDENTIFIER=ADA[a-zA-Z]+
C_HOST_IDENTIFIER=C[a-zA-Z]+
COBOL_HOST_IDENTIFIER=COBOL[a-zA-Z]+
FORTRAN_HOST_IDENTIFIER=FORTRAN[a-zA-Z]+
MUMPS_HOST_IDENTIFIER=MUMPS[a-zA-Z]+
PASCAL_HOST_IDENTIFIER=PASCAL[a-zA-Z]+
PL_I_HOST_IDENTIFIER=PLI[a-zA-Z]+
HOST_LABEL_IDENTIFIER=LABEL[a-zA-Z]+
HOST_PL_I_LABEL_VARIABLE=PLIL[a-zA-Z]+
EMBEDDED_SQL_ADA_PROGRAM=EMBADA[a-zA-Z]+
EMBEDDED_SQL_C_PROGRAM=EMBC[a-zA-Z]+
EMBEDDED_SQL_COBOL_PROGRAM=EMBCOBOL[a-zA-Z]+
EMBEDDED_SQL_FORTRAN_PROGRAM=EMBFORTRAN[a-zA-Z]+
EMBEDDED_SQL_MUMPS_PROGRAM=EMBMUMPS[a-zA-Z]+
EMBEDDED_SQL_PASCAL_PROGRAM=EMBPASCAL[a-zA-Z]+
EMBEDDED_SQL_PL_I_PROGRAM=EMBPLI[a-zA-Z]+
DIRECT_IMPLEMENTATION_DEFINED_STATEMENT=DIRECTIMPL[a-zA-Z]+
LINE_COMMENT=---*[^\n]*
COMMENT="/"\*.*\*"/"

UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL=X?\'(\'\'|[^\'])*
SINGLE_QUOTE_STRING_LITERAL={UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL} \'
UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL=X?\"(\"\"|[^\"])*
DOUBLE_QUOTE_STRING_LITERAL={UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL} \"
UNTERMINATED_BRACKET_LITERAL=\[[^\]]*
BRACKET_LITERAL={UNTERMINATED_BRACKET_LITERAL} \]


%%
<YYINITIAL> {
  {WHITE_SPACE}                                  { return WHITE_SPACE; }

  "("                                            { return LPAREN; }
  ")"                                            { return RPAREN; }
  "."                                            { return DOT; }
  "&"                                            { return AMP; }
  "|"                                            { return BAR; }
  "||"                                           { return CONCAT; }
  "/"                                            { return DIV; }
  "="                                            { return EQ; }
  "=="                                           { return EQEQ; }
  ">"                                            { return GT; }
  ">="                                           { return GTE; }
  "<"                                            { return LT; }
  "<="                                           { return LTE; }
  "-"                                            { return MINUS; }
  "%"                                            { return MOD; }
  "<>"                                           { return NOT_EQ; }
  "+"                                            { return PLUS; }
  "<<"                                           { return SHL; }
  ">>"                                           { return SHR; }
  "*"                                            { return STAR; }
  "~"                                            { return TILDE; }
  "!="                                           { return UNEQ; }
  "Interfaces"                                   { return INTERFACES; }
  "iso"                                          { return ISO; }
  "standard"                                     { return STANDARD; }
  "edition1987"                                  { return EDITION1987; }
  "edition1989"                                  { return EDITION1989; }
  "edition1992"                                  { return EDITION1992; }
  "edition1999"                                  { return EDITION1999; }
  "ABSOLUTE"                                     { return ABSOLUTE; }
  "ACTION"                                       { return ACTION; }
  "ADD"                                          { return ADD; }
  "AFTER"                                        { return AFTER; }
  "ALL"                                          { return ALL; }
  "ALLOCATE"                                     { return ALLOCATE; }
  "ALTER"                                        { return ALTER; }
  "AND"                                          { return AND; }
  "ANY"                                          { return ANY; }
  "ARE"                                          { return ARE; }
  "ARRAY"                                        { return ARRAY; }
  "AS"                                           { return AS; }
  "ASC"                                          { return ASC; }
  "ASSERTION"                                    { return ASSERTION; }
  "AT"                                           { return AT; }
  "AUTHORIZATION"                                { return AUTHORIZATION; }
  "BEFORE"                                       { return BEFORE; }
  "BEGIN"                                        { return BEGIN; }
  "BETWEEN"                                      { return BETWEEN; }
  "BINARY"                                       { return BINARY; }
  "BIT"                                          { return BIT; }
  "BLOB"                                         { return BLOB; }
  "BOOLEAN"                                      { return BOOLEAN; }
  "BOTH"                                         { return BOTH; }
  "BREADTH"                                      { return BREADTH; }
  "BY"                                           { return BY; }
  "CALL"                                         { return CALL; }
  "CASCADE"                                      { return CASCADE; }
  "CASCADED"                                     { return CASCADED; }
  "CASE"                                         { return CASE; }
  "CAST"                                         { return CAST; }
  "CATALOG"                                      { return CATALOG; }
  "CHAR"                                         { return CHAR; }
  "CHARACTER"                                    { return CHARACTER; }
  "CHECK"                                        { return CHECK; }
  "CLOB"                                         { return CLOB; }
  "CLOSE"                                        { return CLOSE; }
  "COLLATE"                                      { return COLLATE; }
  "COLLATION"                                    { return COLLATION; }
  "COLUMN"                                       { return COLUMN; }
  "COMMIT"                                       { return COMMIT; }
  "CONDITION"                                    { return CONDITION; }
  "CONNECT"                                      { return CONNECT; }
  "CONNECTION"                                   { return CONNECTION; }
  "CONSTRAINT"                                   { return CONSTRAINT; }
  "CONSTRAINTS"                                  { return CONSTRAINTS; }
  "CONSTRUCTOR"                                  { return CONSTRUCTOR; }
  "CONTINUE"                                     { return CONTINUE; }
  "CORRESPONDING"                                { return CORRESPONDING; }
  "CREATE"                                       { return CREATE; }
  "CROSS"                                        { return CROSS; }
  "CUBE"                                         { return CUBE; }
  "CURRENT"                                      { return CURRENT; }
  "CURRENT_DATE"                                 { return CURRENT_DATE; }
  "CURRENT_DEFAULT_TRANSFORM_GROUP"              { return CURRENT_DEFAULT_TRANSFORM_GROUP; }
  "CURRENT_TRANSFORM_GROUP_FOR_TYPE"             { return CURRENT_TRANSFORM_GROUP_FOR_TYPE; }
  "CURRENT_PATH"                                 { return CURRENT_PATH; }
  "CURRENT_ROLE"                                 { return CURRENT_ROLE; }
  "CURRENT_TIME"                                 { return CURRENT_TIME; }
  "CURRENT_TIMESTAMP"                            { return CURRENT_TIMESTAMP; }
  "CURRENT_USER"                                 { return CURRENT_USER; }
  "CURSOR"                                       { return CURSOR; }
  "CYCLE"                                        { return CYCLE; }
  "DATA"                                         { return DATA; }
  "DATE"                                         { return DATE; }
  "DAY"                                          { return DAY; }
  "DEALLOCATE"                                   { return DEALLOCATE; }
  "DEC"                                          { return DEC; }
  "DECIMAL"                                      { return DECIMAL; }
  "DECLARE"                                      { return DECLARE; }
  "DEFAULT"                                      { return DEFAULT; }
  "DEFERRABLE"                                   { return DEFERRABLE; }
  "DEFERRED"                                     { return DEFERRED; }
  "DELETE"                                       { return DELETE; }
  "DEPTH"                                        { return DEPTH; }
  "DEREF"                                        { return DEREF; }
  "DESC"                                         { return DESC; }
  "DESCRIBE"                                     { return DESCRIBE; }
  "DESCRIPTOR"                                   { return DESCRIPTOR; }
  "DETERMINISTIC"                                { return DETERMINISTIC; }
  "DIAGNOSTICS"                                  { return DIAGNOSTICS; }
  "DISCONNECT"                                   { return DISCONNECT; }
  "DISTINCT"                                     { return DISTINCT; }
  "DO"                                           { return DO; }
  "DOMAIN"                                       { return DOMAIN; }
  "DOUBLE"                                       { return DOUBLE; }
  "DROP"                                         { return DROP; }
  "DYNAMIC"                                      { return DYNAMIC; }
  "EACH"                                         { return EACH; }
  "ELSE"                                         { return ELSE; }
  "ELSEIF"                                       { return ELSEIF; }
  "END"                                          { return END; }
  "END_EXEC"                                     { return END_EXEC; }
  "EQUALS"                                       { return EQUALS; }
  "ESCAPE"                                       { return ESCAPE; }
  "EXCEPT"                                       { return EXCEPT; }
  "EXCEPTION"                                    { return EXCEPTION; }
  "EXEC"                                         { return EXEC; }
  "EXECUTE"                                      { return EXECUTE; }
  "EXISTS"                                       { return EXISTS; }
  "EXIT"                                         { return EXIT; }
  "EXTERNAL"                                     { return EXTERNAL; }
  "FALSE"                                        { return FALSE; }
  "FETCH"                                        { return FETCH; }
  "FIRST"                                        { return FIRST; }
  "FLOAT"                                        { return FLOAT; }
  "FOR"                                          { return FOR; }
  "FOREIGN"                                      { return FOREIGN; }
  "FOUND"                                        { return FOUND; }
  "FROM"                                         { return FROM; }
  "FREE"                                         { return FREE; }
  "FULL"                                         { return FULL; }
  "FUNCTION"                                     { return FUNCTION; }
  "GENERAL"                                      { return GENERAL; }
  "GET"                                          { return GET; }
  "GLOBAL"                                       { return GLOBAL; }
  "GO"                                           { return GO; }
  "GOTO"                                         { return GOTO; }
  "GRANT"                                        { return GRANT; }
  "GROUP"                                        { return GROUP; }
  "GROUPING"                                     { return GROUPING; }
  "HANDLE"                                       { return HANDLE; }
  "HAVING"                                       { return HAVING; }
  "HOLD"                                         { return HOLD; }
  "HOUR"                                         { return HOUR; }
  "IDENTITY"                                     { return IDENTITY; }
  "IF"                                           { return IF; }
  "IMMEDIATE"                                    { return IMMEDIATE; }
  "IN"                                           { return IN; }
  "INDICATOR"                                    { return INDICATOR; }
  "INITIALLY"                                    { return INITIALLY; }
  "INNER"                                        { return INNER; }
  "INOUT"                                        { return INOUT; }
  "INPUT"                                        { return INPUT; }
  "INSERT"                                       { return INSERT; }
  "INT"                                          { return INT; }
  "INTEGER"                                      { return INTEGER; }
  "INTERSECT"                                    { return INTERSECT; }
  "INTERVAL"                                     { return INTERVAL; }
  "INTO"                                         { return INTO; }
  "IS"                                           { return IS; }
  "ISOLATION"                                    { return ISOLATION; }
  "JOIN"                                         { return JOIN; }
  "KEY"                                          { return KEY; }
  "LANGUAGE"                                     { return LANGUAGE; }
  "LARGE"                                        { return LARGE; }
  "LAST"                                         { return LAST; }
  "LATERAL"                                      { return LATERAL; }
  "LEADING"                                      { return LEADING; }
  "LEAVE"                                        { return LEAVE; }
  "LEFT"                                         { return LEFT; }
  "LEVEL"                                        { return LEVEL; }
  "LIKE"                                         { return LIKE; }
  "LOCAL"                                        { return LOCAL; }
  "LOCALTIME"                                    { return LOCALTIME; }
  "LOCALTIMESTAMP"                               { return LOCALTIMESTAMP; }
  "LOCATOR"                                      { return LOCATOR; }
  "LOOP"                                         { return LOOP; }
  "MAP"                                          { return MAP; }
  "MATCH"                                        { return MATCH; }
  "METHOD"                                       { return METHOD; }
  "MINUTE"                                       { return MINUTE; }
  "MODIFIES"                                     { return MODIFIES; }
  "MODULE"                                       { return MODULE; }
  "MONTH"                                        { return MONTH; }
  "NAMES"                                        { return NAMES; }
  "NATIONAL"                                     { return NATIONAL; }
  "NATURAL"                                      { return NATURAL; }
  "NCHAR"                                        { return NCHAR; }
  "NCLOB"                                        { return NCLOB; }
  "NESTING"                                      { return NESTING; }
  "NEW"                                          { return NEW; }
  "NEXT"                                         { return NEXT; }
  "NO"                                           { return NO; }
  "NONE"                                         { return NONE; }
  "NOT"                                          { return NOT; }
  "NULL"                                         { return NULL; }
  "NUMERIC"                                      { return NUMERIC; }
  "OBJECT"                                       { return OBJECT; }
  "OF"                                           { return OF; }
  "OLD"                                          { return OLD; }
  "ON"                                           { return ON; }
  "ONLY"                                         { return ONLY; }
  "OPEN"                                         { return OPEN; }
  "OPTION"                                       { return OPTION; }
  "OR"                                           { return OR; }
  "ORDER"                                        { return ORDER; }
  "ORDINALITY"                                   { return ORDINALITY; }
  "OUT"                                          { return OUT; }
  "OUTER"                                        { return OUTER; }
  "OUTPUT"                                       { return OUTPUT; }
  "OVERLAPS"                                     { return OVERLAPS; }
  "PAD"                                          { return PAD; }
  "PARAMETER"                                    { return PARAMETER; }
  "PARTIAL"                                      { return PARTIAL; }
  "PATH"                                         { return PATH; }
  "PRECISION"                                    { return PRECISION; }
  "PREPARE"                                      { return PREPARE; }
  "PRESERVE"                                     { return PRESERVE; }
  "PRIMARY"                                      { return PRIMARY; }
  "PRIOR"                                        { return PRIOR; }
  "PRIVILEGES"                                   { return PRIVILEGES; }
  "PROCEDURE"                                    { return PROCEDURE; }
  "PUBLIC"                                       { return PUBLIC; }
  "READ"                                         { return READ; }
  "READS"                                        { return READS; }
  "REAL"                                         { return REAL; }
  "RECURSIVE"                                    { return RECURSIVE; }
  "REDO"                                         { return REDO; }
  "REF"                                          { return REF; }
  "REFERENCES"                                   { return REFERENCES; }
  "REFERENCING"                                  { return REFERENCING; }
  "RELATIVE"                                     { return RELATIVE; }
  "RELEASE"                                      { return RELEASE; }
  "REPEAT"                                       { return REPEAT; }
  "RESIGNAL"                                     { return RESIGNAL; }
  "RESTRICT"                                     { return RESTRICT; }
  "RESULT"                                       { return RESULT; }
  "RETURN"                                       { return RETURN; }
  "RETURNS"                                      { return RETURNS; }
  "REVOKE"                                       { return REVOKE; }
  "RIGHT"                                        { return RIGHT; }
  "ROLE"                                         { return ROLE; }
  "ROLLBACK"                                     { return ROLLBACK; }
  "ROLLUP"                                       { return ROLLUP; }
  "ROUTINE"                                      { return ROUTINE; }
  "ROW"                                          { return ROW; }
  "ROWS"                                         { return ROWS; }
  "SAVEPOINT"                                    { return SAVEPOINT; }
  "SCHEMA"                                       { return SCHEMA; }
  "SCROLL"                                       { return SCROLL; }
  "SEARCH"                                       { return SEARCH; }
  "SECOND"                                       { return SECOND; }
  "SECTION"                                      { return SECTION; }
  "SELECT"                                       { return SELECT; }
  "SESSION"                                      { return SESSION; }
  "SET"                                          { return SET; }
  "SETS"                                         { return SETS; }
  "SIGNAL"                                       { return SIGNAL; }
  "SIMILAR"                                      { return SIMILAR; }
  "SIZE"                                         { return SIZE; }
  "SMALLINT"                                     { return SMALLINT; }
  "SOME"                                         { return SOME; }
  "SPACE"                                        { return SPACE; }
  "SPECIFIC"                                     { return SPECIFIC; }
  "SPECIFICTYPE"                                 { return SPECIFICTYPE; }
  "SQL"                                          { return SQL; }
  "SQLEXCEPTION"                                 { return SQLEXCEPTION; }
  "SQLSTATE"                                     { return SQLSTATE; }
  "SQLWARNING"                                   { return SQLWARNING; }
  "START"                                        { return START; }
  "STATE"                                        { return STATE; }
  "STATIC"                                       { return STATIC; }
  "TABLE"                                        { return TABLE; }
  "TEMPORARY"                                    { return TEMPORARY; }
  "THEN"                                         { return THEN; }
  "TIME"                                         { return TIME; }
  "TIMESTAMP"                                    { return TIMESTAMP; }
  "TO"                                           { return TO; }
  "TRAILING"                                     { return TRAILING; }
  "TRANSACTION"                                  { return TRANSACTION; }
  "TRANSLATION"                                  { return TRANSLATION; }
  "TREAT"                                        { return TREAT; }
  "TRIGGER"                                      { return TRIGGER; }
  "TRUE"                                         { return TRUE; }
  "UNDER"                                        { return UNDER; }
  "UNDO"                                         { return UNDO; }
  "UNION"                                        { return UNION; }
  "UNIQUE"                                       { return UNIQUE; }
  "UNKNOWN"                                      { return UNKNOWN; }
  "UNNEST"                                       { return UNNEST; }
  "UNTIL"                                        { return UNTIL; }
  "UPDATE"                                       { return UPDATE; }
  "USAGE"                                        { return USAGE; }
  "USER"                                         { return USER; }
  "USING"                                        { return USING; }
  "VALUE"                                        { return VALUE; }
  "VALUES"                                       { return VALUES; }
  "VARCHAR"                                      { return VARCHAR; }
  "VARYING"                                      { return VARYING; }
  "VIEW"                                         { return VIEW; }
  "WHEN"                                         { return WHEN; }
  "WHENEVER"                                     { return WHENEVER; }
  "WHERE"                                        { return WHERE; }
  "WHILE"                                        { return WHILE; }
  "WITH"                                         { return WITH; }
  "WITHOUT"                                      { return WITHOUT; }
  "WORK"                                         { return WORK; }
  "WRITE"                                        { return WRITE; }
  "YEAR"                                         { return YEAR; }
  "ZONE"                                         { return ZONE; }
  "IntegrityNo"                                  { return INTEGRITYNO; }
  "IntegrityYes"                                 { return INTEGRITYYES; }
  "sqlbindings1999"                              { return SQLBINDINGS1999; }
  "directyes"                                    { return DIRECTYES; }
  "directno"                                     { return DIRECTNO; }
  "embeddedno"                                   { return EMBEDDEDNO; }
  "embeddedAda"                                  { return EMBEDDEDADA; }
  "embeddedC"                                    { return EMBEDDEDC; }
  "embeddedCOBOL"                                { return EMBEDDEDCOBOL; }
  "embeddedFortran"                              { return EMBEDDEDFORTRAN; }
  "embeddedMUMPS"                                { return EMBEDDEDMUMPS; }
  "embeddedPascal"                               { return EMBEDDEDPASCAL; }
  "embeddedPLI"                                  { return EMBEDDEDPLI; }
  "delimited_identifier"                         { return DELIMITED_IDENTIFIER; }
  "simple_Latin_letter"                          { return SIMPLE_LATIN_LETTER; }
  "digit"                                        { return DIGIT; }
  "ADA"                                          { return ADA; }
  "C"                                            { return C; }
  "COBOL"                                        { return COBOL; }
  "FORTRAN"                                      { return FORTRAN; }
  "MUMPS"                                        { return MUMPS; }
  "PASCAL"                                       { return PASCAL; }
  "PLI"                                          { return PLI; }
  "TRANSFORM"                                    { return TRANSFORM; }
  "TYPE"                                         { return TYPE; }
  "CHECKED"                                      { return CHECKED; }
  "SCOPE"                                        { return SCOPE; }
  "SESSION_USER"                                 { return SESSION_USER; }
  "SYSTEM_USER"                                  { return SYSTEM_USER; }
  "E"                                            { return E; }
  "N"                                            { return N; }
  "B"                                            { return B; }
  "X"                                            { return X; }
  "A"                                            { return A; }
  "D"                                            { return D; }
  "F"                                            { return F; }
  "SIMPLE"                                       { return SIMPLE; }
  "COUNT"                                        { return COUNT; }
  "AVG"                                          { return AVG; }
  "MAX"                                          { return MAX; }
  "MIN"                                          { return MIN; }
  "SUM"                                          { return SUM; }
  "EVERY"                                        { return EVERY; }
  "NULLIF"                                       { return NULLIF; }
  "COALESCE"                                     { return COALESCE; }
  "POSITION"                                     { return POSITION; }
  "SUBSTRING"                                    { return SUBSTRING; }
  "UPPER"                                        { return UPPER; }
  "LOWER"                                        { return LOWER; }
  "CONVERT"                                      { return CONVERT; }
  "TRANSLATE"                                    { return TRANSLATE; }
  "TRIM"                                         { return TRIM; }
  "OVERLAY"                                      { return OVERLAY; }
  "PLACING"                                      { return PLACING; }
  "EXTRACT"                                      { return EXTRACT; }
  "TIMEZONE_HOUR"                                { return TIMEZONE_HOUR; }
  "TIMEZONE_MINUTE"                              { return TIMEZONE_MINUTE; }
  "ABS"                                          { return ABS; }
  "CHAR_LENGTH"                                  { return CHAR_LENGTH; }
  "CHARACTER_LENGTH"                             { return CHARACTER_LENGTH; }
  "OCTET_LENGTH"                                 { return OCTET_LENGTH; }
  "BIT_LENGTH"                                   { return BIT_LENGTH; }
  "CARDINALITY"                                  { return CARDINALITY; }
  "ASYMMETRIC"                                   { return ASYMMETRIC; }
  "SYMMETRIC"                                    { return SYMMETRIC; }
  "SYSTEM"                                       { return SYSTEM; }
  "GENERATED"                                    { return GENERATED; }
  "DERIVED"                                      { return DERIVED; }
  "OPTIONS"                                      { return OPTIONS; }
  "SENSITIVE"                                    { return SENSITIVE; }
  "INSENSITIVE"                                  { return INSENSITIVE; }
  "ASENSITIVE"                                   { return ASENSITIVE; }
  "INSTANCE"                                     { return INSTANCE; }
  "STATEMENT"                                    { return STATEMENT; }
  "INSTANTIABLE"                                 { return INSTANTIABLE; }
  "FINAL"                                        { return FINAL; }
  "SOURCE"                                       { return SOURCE; }
  "SELF"                                         { return SELF; }
  "STYLE"                                        { return STYLE; }
  "CONTAINS"                                     { return CONTAINS; }
  "CALLED"                                       { return CALLED; }
  "OVERRIDING"                                   { return OVERRIDING; }
  "NAME"                                         { return NAME; }
  "SECURITY"                                     { return SECURITY; }
  "DEFINER"                                      { return DEFINER; }
  "INVOKER"                                      { return INVOKER; }
  "IMPLEMENTATION"                               { return IMPLEMENTATION; }
  "DEFINED"                                      { return DEFINED; }
  "DISPATCH"                                     { return DISPATCH; }
  "HIERARCHY"                                    { return HIERARCHY; }
  "GRANTED"                                      { return GRANTED; }
  "module_name"                                  { return MODULE_NAME; }
  "ADMIN"                                        { return ADMIN; }
  "ASSIGNMENT"                                   { return ASSIGNMENT; }
  "ORDERING"                                     { return ORDERING; }
  "TRANSFORMS"                                   { return TRANSFORMS; }
  "ATTRIBUTE"                                    { return ATTRIBUTE; }
  "UNCOMMITTED"                                  { return UNCOMMITTED; }
  "COMMITTED"                                    { return COMMITTED; }
  "REPEATABLE"                                   { return REPEATABLE; }
  "SERIALIZABLE"                                 { return SERIALIZABLE; }
  "CHAIN"                                        { return CHAIN; }
  "CHARACTERISTICS"                              { return CHARACTERISTICS; }
  "NUMBER"                                       { return NUMBER; }
  "MORE"                                         { return MORE; }
  "COMMAND_FUNCTION"                             { return COMMAND_FUNCTION; }
  "COMMAND_FUNCTION_CODE"                        { return COMMAND_FUNCTION_CODE; }
  "DYNAMIC_FUNCTION"                             { return DYNAMIC_FUNCTION; }
  "DYNAMIC_FUNCTION_CODE"                        { return DYNAMIC_FUNCTION_CODE; }
  "ROW_COUNT"                                    { return ROW_COUNT; }
  "TRANSACTIONS_COMMITTED"                       { return TRANSACTIONS_COMMITTED; }
  "TRANSACTIONS_ROLLED_BACK"                     { return TRANSACTIONS_ROLLED_BACK; }
  "TRANSACTION_ACTIVE"                           { return TRANSACTION_ACTIVE; }
  "CATALOG_NAME"                                 { return CATALOG_NAME; }
  "CLASS_ORIGIN"                                 { return CLASS_ORIGIN; }
  "COLUMN_NAME"                                  { return COLUMN_NAME; }
  "CONDITION_IDENTIFIER"                         { return CONDITION_IDENTIFIER; }
  "CONDITION_NUMBER"                             { return CONDITION_NUMBER; }
  "CONNECTION_NAME"                              { return CONNECTION_NAME; }
  "CONSTRAINT_CATALOG"                           { return CONSTRAINT_CATALOG; }
  "CONSTRAINT_NAME"                              { return CONSTRAINT_NAME; }
  "CONSTRAINT_SCHEMA"                            { return CONSTRAINT_SCHEMA; }
  "CURSOR_NAME"                                  { return CURSOR_NAME; }
  "MESSAGE_LENGTH"                               { return MESSAGE_LENGTH; }
  "MESSAGE_OCTET_LENGTH"                         { return MESSAGE_OCTET_LENGTH; }
  "MESSAGE_TEXT"                                 { return MESSAGE_TEXT; }
  "PARAMETER_MODE"                               { return PARAMETER_MODE; }
  "PARAMETER_NAME"                               { return PARAMETER_NAME; }
  "PARAMETER_ORDINAL_POSITION"                   { return PARAMETER_ORDINAL_POSITION; }
  "RETURNED_SQLSTATE"                            { return RETURNED_SQLSTATE; }
  "ROUTINE_CATALOG"                              { return ROUTINE_CATALOG; }
  "ROUTINE_NAME"                                 { return ROUTINE_NAME; }
  "ROUTINE_SCHEMA"                               { return ROUTINE_SCHEMA; }
  "SCHEMA_NAME"                                  { return SCHEMA_NAME; }
  "SERVER_NAME"                                  { return SERVER_NAME; }
  "SPECIFIC_NAME"                                { return SPECIFIC_NAME; }
  "SUBCLASS_ORIGIN"                              { return SUBCLASS_ORIGIN; }
  "TABLE_NAME"                                   { return TABLE_NAME; }
  "TRIGGER_CATALOG"                              { return TRIGGER_CATALOG; }
  "TRIGGER_NAME"                                 { return TRIGGER_NAME; }
  "TRIGGER_SCHEMA"                               { return TRIGGER_SCHEMA; }
  "SQLR"                                         { return SQLR; }
  "AllocConnect"                                 { return ALLOCCONNECT; }
  "AllocEnv"                                     { return ALLOCENV; }
  "AllocHandle"                                  { return ALLOCHANDLE; }
  "AllocStmt"                                    { return ALLOCSTMT; }
  "BindCol"                                      { return BINDCOL; }
  "BindParameter"                                { return BINDPARAMETER; }
  "Cancel"                                       { return CANCEL; }
  "CloseCursor"                                  { return CLOSECURSOR; }
  "ColAttribute"                                 { return COLATTRIBUTE; }
  "ColumnPrivileges"                             { return COLUMNPRIVILEGES; }
  "Columns"                                      { return COLUMNS; }
  "CopyDesc"                                     { return COPYDESC; }
  "DataSources"                                  { return DATASOURCES; }
  "DescribeCol"                                  { return DESCRIBECOL; }
  "EndTran"                                      { return ENDTRAN; }
  "Error"                                        { return ERROR; }
  "ExecDirect"                                   { return EXECDIRECT; }
  "FetchScroll"                                  { return FETCHSCROLL; }
  "ForeignKeys"                                  { return FOREIGNKEYS; }
  "FreeConnect"                                  { return FREECONNECT; }
  "FreeEnv"                                      { return FREEENV; }
  "FreeHandle"                                   { return FREEHANDLE; }
  "FreeStmt"                                     { return FREESTMT; }
  "GetConnectAttr"                               { return GETCONNECTATTR; }
  "GetCursorName"                                { return GETCURSORNAME; }
  "GetData"                                      { return GETDATA; }
  "GetDescField"                                 { return GETDESCFIELD; }
  "GetDescRec"                                   { return GETDESCREC; }
  "GetDiagField"                                 { return GETDIAGFIELD; }
  "GetDiagRec"                                   { return GETDIAGREC; }
  "GetEnvAttr"                                   { return GETENVATTR; }
  "GetFeatureInfo"                               { return GETFEATUREINFO; }
  "GetFunctions"                                 { return GETFUNCTIONS; }
  "GetInfo"                                      { return GETINFO; }
  "GetLength"                                    { return GETLENGTH; }
  "GetParamData"                                 { return GETPARAMDATA; }
  "GetPosition"                                  { return GETPOSITION; }
  "GetSessionInfo"                               { return GETSESSIONINFO; }
  "GetStmtAttr"                                  { return GETSTMTATTR; }
  "GetSubString"                                 { return GETSUBSTRING; }
  "GetTypeInfo"                                  { return GETTYPEINFO; }
  "MoreResults"                                  { return MORERESULTS; }
  "NextResult"                                   { return NEXTRESULT; }
  "NumResultCols"                                { return NUMRESULTCOLS; }
  "ParamData"                                    { return PARAMDATA; }
  "PrimaryKeys"                                  { return PRIMARYKEYS; }
  "PutData"                                      { return PUTDATA; }
  "RowCount"                                     { return ROWCOUNT; }
  "SetConnectAttr"                               { return SETCONNECTATTR; }
  "SetCursorName"                                { return SETCURSORNAME; }
  "SetDescField"                                 { return SETDESCFIELD; }
  "SetDescRec"                                   { return SETDESCREC; }
  "SetEnvAttr"                                   { return SETENVATTR; }
  "SetStmtAttr"                                  { return SETSTMTATTR; }
  "SpecialColumns"                               { return SPECIALCOLUMNS; }
  "StartTran"                                    { return STARTTRAN; }
  "TablePrivileges"                              { return TABLEPRIVILEGES; }
  "Tables"                                       { return TABLES; }
  "DEFIN"                                        { return DEFIN; }
  "DEFOUT"                                       { return DEFOUT; }
  "DEF"                                          { return DEF; }
  "ATOMIC"                                       { return ATOMIC; }
  "HANDLER"                                      { return HANDLER; }
  "ITERATE"                                      { return ITERATE; }
  "KEY_TYPE"                                     { return KEY_TYPE; }
  "TOP_LEVEL_COUNT"                              { return TOP_LEVEL_COUNT; }
  "CHARACTER_SET_CATALOG"                        { return CHARACTER_SET_CATALOG; }
  "CHARACTER_SET_NAME"                           { return CHARACTER_SET_NAME; }
  "CHARACTER_SET_SCHEMA"                         { return CHARACTER_SET_SCHEMA; }
  "COLLATION_CATALOG"                            { return COLLATION_CATALOG; }
  "COLLATION_NAME"                               { return COLLATION_NAME; }
  "COLLATION_SCHEMA"                             { return COLLATION_SCHEMA; }
  "DATETIME_INTERVAL_CODE"                       { return DATETIME_INTERVAL_CODE; }
  "DATETIME_INTERVAL_PRECISION"                  { return DATETIME_INTERVAL_PRECISION; }
  "DEGREE"                                       { return DEGREE; }
  "KEY_MEMBER"                                   { return KEY_MEMBER; }
  "LENGTH"                                       { return LENGTH; }
  "NULLABLE"                                     { return NULLABLE; }
  "PARAMETER_SPECIFIC_CATALOG"                   { return PARAMETER_SPECIFIC_CATALOG; }
  "PARAMETER_SPECIFIC_NAME"                      { return PARAMETER_SPECIFIC_NAME; }
  "PARAMETER_SPECIFIC_SCHEMA"                    { return PARAMETER_SPECIFIC_SCHEMA; }
  "RETURNED_CARDINALITY"                         { return RETURNED_CARDINALITY; }
  "RETURNED_LENGTH"                              { return RETURNED_LENGTH; }
  "RETURNED_OCTET_LENGTH"                        { return RETURNED_OCTET_LENGTH; }
  "SCALE"                                        { return SCALE; }
  "SCOPE_CATALOG"                                { return SCOPE_CATALOG; }
  "SCOPE_NAME"                                   { return SCOPE_NAME; }
  "SCOPE_SCHEMA"                                 { return SCOPE_SCHEMA; }
  "UNNAMED"                                      { return UNNAMED; }
  "USER_DEFINED_TYPE_CATALOG"                    { return USER_DEFINED_TYPE_CATALOG; }
  "USER_DEFINED_TYPE_NAME"                       { return USER_DEFINED_TYPE_NAME; }
  "USER_DEFINED_TYPE_SCHEMA"                     { return USER_DEFINED_TYPE_SCHEMA; }
  "STRUCTURE"                                    { return STRUCTURE; }
  "DOUBLE_PRECISION"                             { return DOUBLE_PRECISION; }
  "SQLSTATE_TYPE"                                { return SQLSTATE_TYPE; }
  "INDICATOR_TYPE"                               { return INDICATOR_TYPE; }
  "colonequals_operator"                         { return COLONEQUALS_OPERATOR; }
  "auto"                                         { return AUTO; }
  "extern"                                       { return EXTERN; }
  "const"                                        { return CONST; }
  "volatile"                                     { return VOLATILE; }
  "long"                                         { return LONG; }
  "short"                                        { return SHORT; }
  "unsigned"                                     { return UNSIGNED; }
  "PIC"                                          { return PIC; }
  "PICTURE"                                      { return PICTURE; }
  "DISPLAY"                                      { return DISPLAY; }
  "SIGN"                                         { return SIGN; }
  "SEPARATE"                                     { return SEPARATE; }
  "COBOL_nines"                                  { return COBOL_NINES; }
  "KIND"                                         { return KIND; }
  "LOGICAL"                                      { return LOGICAL; }
  "PACKED"                                       { return PACKED; }
  "DCL"                                          { return DCL; }
  "FIXED"                                        { return FIXED; }
  "BIN"                                          { return BIN; }
  "simple_Latin_upper_case_letter"               { return SIMPLE_LATIN_UPPER_CASE_LETTER; }
  "UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL"     { return UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL; }
  "UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL"     { return UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL; }
  "UNTERMINATED_BRACKET_LITERAL"                 { return UNTERMINATED_BRACKET_LITERAL; }
  "BRACKET_LITERAL"                              { return BRACKET_LITERAL; }

  {IDENTIFIER_BODY}                              { return IDENTIFIER_BODY; }
  {NUMERIC_LITERAL}                              { return NUMERIC_LITERAL; }
  {SINGLE_QUOTE_STRING_LITERAL}                  { return SINGLE_QUOTE_STRING_LITERAL; }
  {DOUBLE_QUOTE_STRING_LITERAL}                  { return DOUBLE_QUOTE_STRING_LITERAL; }
  {ADA_HOST_IDENTIFIER}                          { return ADA_HOST_IDENTIFIER; }
  {C_HOST_IDENTIFIER}                            { return C_HOST_IDENTIFIER; }
  {COBOL_HOST_IDENTIFIER}                        { return COBOL_HOST_IDENTIFIER; }
  {FORTRAN_HOST_IDENTIFIER}                      { return FORTRAN_HOST_IDENTIFIER; }
  {MUMPS_HOST_IDENTIFIER}                        { return MUMPS_HOST_IDENTIFIER; }
  {PASCAL_HOST_IDENTIFIER}                       { return PASCAL_HOST_IDENTIFIER; }
  {PL_I_HOST_IDENTIFIER}                         { return PL_I_HOST_IDENTIFIER; }
  {HOST_LABEL_IDENTIFIER}                        { return HOST_LABEL_IDENTIFIER; }
  {HOST_PL_I_LABEL_VARIABLE}                     { return HOST_PL_I_LABEL_VARIABLE; }
  {EMBEDDED_SQL_ADA_PROGRAM}                     { return EMBEDDED_SQL_ADA_PROGRAM; }
  {EMBEDDED_SQL_C_PROGRAM}                       { return EMBEDDED_SQL_C_PROGRAM; }
  {EMBEDDED_SQL_COBOL_PROGRAM}                   { return EMBEDDED_SQL_COBOL_PROGRAM; }
  {EMBEDDED_SQL_FORTRAN_PROGRAM}                 { return EMBEDDED_SQL_FORTRAN_PROGRAM; }
  {EMBEDDED_SQL_MUMPS_PROGRAM}                   { return EMBEDDED_SQL_MUMPS_PROGRAM; }
  {EMBEDDED_SQL_PASCAL_PROGRAM}                  { return EMBEDDED_SQL_PASCAL_PROGRAM; }
  {EMBEDDED_SQL_PL_I_PROGRAM}                    { return EMBEDDED_SQL_PL_I_PROGRAM; }
  {DIRECT_IMPLEMENTATION_DEFINED_STATEMENT}      { return DIRECT_IMPLEMENTATION_DEFINED_STATEMENT; }
  {LINE_COMMENT}                                 { return LINE_COMMENT; }
  {COMMENT}                                      { return COMMENT; }

  {UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL} { return UNTERMINATED_SINGLE_QUOTE_STRING_LITERAL; }
  {UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL} { return UNTERMINATED_DOUBLE_QUOTE_STRING_LITERAL; }
  {UNTERMINATED_BRACKET_LITERAL}             { return UNTERMINATED_BRACKET_LITERAL; }
  {BRACKET_LITERAL}                   { return BRACKET_LITERAL; }

}

[^] { return BAD_CHARACTER; }
