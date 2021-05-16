# StrEntities

[pkg-url]: https://github.com/JuliaString/StrEntities.jl.git

[julia-url]:    https://github.com/JuliaLang/Julia
[julia-release]:https://img.shields.io/github/release/JuliaLang/julia.svg

[release]:      https://img.shields.io/github/release/JuliaString/StrEntities.jl.svg
[release-date]: https://img.shields.io/github/release-date/JuliaString/StrEntities.jl.svg

[license-img]:  http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat
[license-url]:  LICENSE.md

[gitter-img]:   https://badges.gitter.im/Join%20Chat.svg
[gitter-url]:   https://gitter.im/JuliaString/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge

[checks]:       https://img.shields.io/github/checks-status/JuliaString/StrEntities.jl/master

[codecov-url]:  https://codecov.io/gh/JuliaString/StrEntities.jl
[codecov-img]:  https://codecov.io/gh/JuliaString/StrEntities.jl/branch/master/graph/badge.svg

[contrib]:    https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat

[![][release]][pkg-url] [![][release-date]][pkg-url] [![][license-img]][license-url] [![contributions welcome][contrib]](https://github.com/JuliaString/StrEntities.jl/issues)

| **Julia Version** | **Unit Tests** | **Coverage** |
|:------------------:|:------------------:|:---------------------:|
| [![][julia-release]][julia-url] | | [![][codecov-img]][codecov-url]
| Julia Latest | [![][checks]][pkg-url] | [![][codecov-img]][codecov-url]

StrEntities extends the string literals provided by the [StrLiterals](https://github.com/JuliaString/StrLiterals.jl) package.
It adds support for HTML, LaTeX, Unicode and Emoji entities, provided by the packages:
* [HTML_Entities](https://github.com/JuliaString/HTML_Entities.jl)
* [LaTeX_Entities](https://github.com/JuliaString/LaTeX_Entities.jl)
* [Emoji_Entities](https://github.com/JuliaString/Emoji_Entities.jl)
* [Unicode_Entities](https://github.com/JuliaString/Unicode_Entities.jl)

This adds four ways of representing characters in the literal string,
`\:emojiname:`, `\<latexname>`, `\&htmlname;` and `\N{UnicodeName}`.
This makes life a lot easier when you want to keep the text of a program in ASCII, and
also to be able to write programs using those characters that might not even display
correctly in their editor.

* `\<` followed by a LaTeX entity name followed by `>` outputs that character or sequence if the name is valid.
* `\:` followed by an Emoji name followed by `:` outputs that character or sequence (if a valid name)
* `\&` followed by an HTML entity name followed by `;` outputs that character or sequence (if a valid name)
* `\N{` followed by a Unicode entity name (case-insensitive!) followed by a `}` outputs that Unicode character (if a valid name)
