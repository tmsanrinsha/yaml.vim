syntax cluster BlockItem contains=BlockSequenceEntry,BlockMappingExplicitEntry,BlockMappingImplicitEntry

" {{{ Stream
" syntax region Stream
"     \ start=/\%^/
"     \ end=/\%$/
"     \ fold keepend
"     \ contains=DirectivesDocument,ExplicitDocument,BareDocument
" }}}

" {{{ DirectivesDocument
syntax region DirectivesDocument
    \ start=/^%/
    \ end=/^\.\.\.\|^\(---\)\_.\{-}^\(---\)\@=/
    \ keepend
    \ contains=Directives,ExplicitDocument
" }}}

" {{{ Directives
syntax region Directives
    \ start=/^%/
    \ end=/^\.\.\.\|^\(---\)\@=/
    \ fold keepend
    \ contains=NONE
    \ contained
" }}}

" {{{ ExplicitDocument
syntax region ExplicitDocument
    \ start=/^---/
    \ end=/^\.\.\.\|^\(---\)\@=/
    \ fold keepend
    \ contains=@BlockItem
" }}}

" {{{ BareDocument
" syntax region BareDocument
"     \ start=/.\?/
"     \ end=/^\.\.\.\|^\(---\)\@=/
"     \ fold keepend
"     \ transparent
"     \ contains=@BlockItem
" }}}

" {{{ BlockSequenceEntry
syntax region BlockSequenceEntry
    \ start=/^\z( *\)-\_[ ]/
    \ skip=/^\z1 \|^\%[\z1]$\|^\%[\z1]#.*$/
    \ end=/^/
    \ fold keepend
    \ transparent
    \ contains=ALL
" }}}

" {{{ BlockMappingExplicitEntry
syntax region BlockMappingExplicitEntry
    \ start=/^\z( *\)?\_[ ]\@=/
    \ skip=/^\z1[ :]\|^\%[\z1]$\|^\%[\z1]#.*$/
    \ end=/^/
    \ fold keepend
    \ transparent
    \ contains=ALL
" }}}

" {{{ BlockMappingImplicitEntry
syntax region BlockMappingImplicitEntry
    \ start=/^\z( *\)\([^ ?-]\|-[^ \n]\)[^#]*:\_[ ]\@=/
    \ skip=/^\z1[ -]\|^\%[\z1]$\|^\%[\z1]#.*$/
    \ end=/^/
    \ fold keepend
    \ transparent
    \ contains=ALL
" }}}

" vim: fdm=marker expandtab
