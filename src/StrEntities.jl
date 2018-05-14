__precompile__(true)
""""
Add LaTeX, Emoji, HTML, and Unicode names to Str string literals

Copyright 2018 Gandalf Software, Inc., Scott P. Jones
Licensed under MIT License, see LICENSE.md
"""
module StrEntities

using APITools, StrTables, HTML_Entities, LaTeX_Entities, Emoji_Entities, Unicode_Entities

@api init

@api extend StrAPI, CharSetEncodings, Chars, StrBase, StrLiterals

function _parse_entity(io, str, pos, begseq, fin, tab, nam)
    beg = pos # start location
    chr, pos = next(str, pos)
    while chr != fin
        done(str, pos) && throw_arg_err("\\$begseq missing ending $fin in ", str)
        chr, pos = next(str, pos)
    end
    seq = lookupname(tab, str[beg:pos-2])
    seq == "" && throw_arg_err("Invalid $nam name in ", str)
    print(io, seq)
    pos
end

_parse_html(io, str, pos, chr)  =
    _parse_entity(io, str, pos, "&", ';', HTML_Entities.default, "HTML")
_parse_latex(io, str, pos, chr) =
    _parse_entity(io, str, pos, "<", '>', LaTeX_Entities.default, "LaTeX")
_parse_emoji(io, str, pos, chr) =
    _parse_entity(io, str, pos, ":", ':', Emoji_Entities.default, "Emoji")

function _parse_unicode(io, str, pos, chr)
    done(str, pos) && throw_arg_err("\\N incomplete in ", str)
    chr, pos = next(str, pos)
    chr == '{' || throw_arg_err("\\N missing initial { in ", str)
    done(str, pos) && throw_arg_err("\\N{ incomplete in ", str)
    _parse_entity(io, str, pos, "N{", '}', Unicode_Entities.default, "Unicode")
end

function __init__()
    parse_chr[':'] = _parse_emoji
    parse_chr['&'] = _parse_html
    parse_chr['<'] = _parse_latex
    parse_chr['N'] = _parse_unicode
end

@api freeze
end # module StrEntities
