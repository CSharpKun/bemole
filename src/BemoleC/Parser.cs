using Silverfly;

namespace BemoleC;

public sealed class BemoleGrammar : Parser
{
    protected override void InitLexer(LexerConfig lexer)
    {
        ArgumentNullException.ThrowIfNull(lexer, nameof(lexer));
        lexer.AddKeywords("void", "null", "int", "string", "bool", "true", "false");
        lexer.AddKeywords("def", "nameof", "typeof", "namespace");
        lexer.IgnoreWhitespace();
        lexer.MatchBoolean();
        lexer.MatchNumber(allowHex: true, allowBin: true, floatingPointSymbol: '.');
        lexer.MatchString('"', '"');
        lexer.MatchString('\'', '\'');
    }

    protected override void InitParser(ParserDefinition parser)
    {
        ArgumentNullException.ThrowIfNull(parser, nameof(parser));
        parser.AddCommonLiterals();
        parser.AddArithmeticOperators();
        parser.AddCommonAssignmentOperators();
        parser.AddLogicalOperators();
        parser.AddBitOperators();
    }
}