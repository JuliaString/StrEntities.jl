# StrEntities

| **Package Status** | **Package Evaluator** | **Coverage**      |
|:------------------:|:---------------------:|:-----------------:|
| [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](LICENSE.md) [![Build Status](https://travis-ci.org/JuliaString/StrEntities.jl.svg?branch=master)](https://travis-ci.org/JuliaString/StrEntities.jl) | [![StrEntities](http://pkg.julialang.org/badges/StrEntities_0.6.svg)](http://pkg.julialang.org/?pkg=StrEntities) [![StrEntities](http://pkg.julialang.org/badges/StrEntities_0.7.svg)](http://pkg.julialang.org/?pkg=StrEntities) | [![Coverage Status](https://coveralls.io/repos/github/JuliaString/StrEntities.jl/badge.svg?branch=master)](https://coveralls.io/github/JuliaString/StrEntities.jl?branch=master)
[![codecov.io](http://codecov.io/github/JuliaString/StrEntities.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaString/StrEntities.jl?branch=master) |

StrEntities extends the string literals provided by the [StrLiterals](https://github.com/JuliaString/StrLiterals.jl) package.
It adds support for HTML, LaTeX, Unicode and Emoji entities, provided by the packages:
* [HTML_Entities](https://github.com/JuliaString/HTML_Entities.jl)
* [LaTeX_Entities](https://github.com/JuliaString/LaTeX_Entities.jl)
* [Emoji_Entities](https://github.com/JuliaString/Emoji_Entities.jl)
* [Unicodde_Entities](https://github.com/JuliaString/Unicode_Entities.jl)

This adds four ways of representing characters in the literal string,
`\:emojiname:`, `\<latexname>`, `\&htmlname;` and `\N{UnicodeName}`.
This makes life a lot easier when you want to keep the text of a program in ASCII, and
also to be able to write programs using those characters that might not even display
correctly in their editor.

* `\<` followed by a LaTeX entity name followed by `>` outputs that character or sequence if the name is valid.
* `\:` followed by an Emoji name followed by `:` outputs that character or sequence (if a valid name)
* `\&` followed by an HTML entity name followed by `;` outputs that character or sequence (if a valid name)
* `\N{` followed by a Unicode entity name (case-insensitive!) followed by a `}` outputs that Unicode character (if a valid name)
