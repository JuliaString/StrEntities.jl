""""
Add LaTeX, Emoji, HTML, and Unicode names to Str string literals

Copyright 2018-2021 Gandalf Software, Inc., Scott P. Jones
Licensed under MIT License, see LICENSE.md
"""
module StrEntities

using ModuleInterfaceTools, StrTables
using HTML_Entities, LaTeX_Entities, Emoji_Entities, Unicode_Entities

@api extend! StrLiterals

# Export from here as well so that people can do just `using StrEntities`
export @f_str, @pr_str, @F_str, @PR_str, @sym_str

function _parse_entity(io, str, pos, begseq, fin, tab, nam)
    beg = pos # start location
    chr, pos = iterate(str, pos)
    while chr != fin
        check_done(str, pos, "\\$begseq missing ending $fin")
        chr, pos = iterate(str, pos)
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
    check_done(str, pos, "\\N incomplete")
    chr, pos = iterate(str, pos)
    chr == '{' || throw_arg_err("\\N missing initial { in ", str)
    check_done(str, pos, "\\N{ incomplete")
    _parse_entity(io, str, pos, "N{", '}', Unicode_Entities.default, "Unicode")
end

function __init__()
    StrLiterals.parse_chr[':'] = _parse_emoji
    StrLiterals.parse_chr['&'] = _parse_html
    StrLiterals.parse_chr['<'] = _parse_latex
    StrLiterals.parse_chr['N'] = _parse_unicode
end

end # module StrEntities
