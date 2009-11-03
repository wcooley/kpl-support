" Vim syntax file
" Language:     KPL (Kernel Programming Language)
" Maintainer:   Wil Cooley <wcooley@nakedape.CC>
" Filenames:    *.c, *.h (conflicts, of course, with C)
"
" Note that since the KPL file names conflict with C, you have to put
" "vim:ft=kpl" in a comment towards the end of the file 
"

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn match   kplComment      "[-][-].*"

syn keyword kplStatement    behavior    endBehavior
syn keyword kplStatement    class       endClass
syn keyword kplStatement    code        endCode
syn keyword kplStatement    function    endFunction
syn keyword kplStatement    header      endHeader
syn keyword kplStatement    interface   endInterface
syn keyword kplStatement    method      endMethod
syn keyword kplStatement    infix
syn keyword kplStatement    prefix

syn keyword kplStatement    break
syn keyword kplStatement    by
syn keyword kplStatement    catch
syn keyword kplStatement    const
syn keyword kplStatement    continue
syn keyword kplStatement    debug
syn keyword kplStatement    default
syn keyword kplStatement    do

syn keyword kplStatement    if
syn keyword kplStatement    else
syn keyword kplStatement    elseIf
syn keyword kplStatement    endIf

syn keyword kplStatement    for endFor
syn keyword kplStatement    case switch endSwitch
syn keyword kplStatement    try endTry
syn keyword kplStatement    while endWhile

syn keyword kplStatement    errors
syn keyword kplStatement    extends
syn keyword kplStatement    external
syn keyword kplStatement    fields
syn keyword kplStatement    implements
syn keyword kplStatement    messages
syn keyword kplStatement    methods
syn keyword kplStatement    of
syn keyword kplStatement    renaming
syn keyword kplStatement    return
syn keyword kplStatement    returns
syn keyword kplStatement    superclass
syn keyword kplStatement    throw
syn keyword kplStatement    type
syn keyword kplStatement    until
syn keyword kplStatement    uses
syn keyword kplStatement    var

" These have to be matches instead of keywords so they do not take precedence
" over kplType 'ptr to', which has to be a match.
syn match   kplStatement    "\<ptr\>"
syn match   kplStatement    "\<to\>"

syn keyword kplType         array
syn keyword kplType         anyType
syn keyword kplType         bool
syn keyword kplType         char
syn keyword kplType         double
syn keyword kplType         enum
syn keyword kplType         int
syn keyword kplType         typeOfNull
syn match   kplType         "\<ptr to\>"
syn keyword kplType         void
syn keyword kplType         record
syn keyword kplType         endRecord

syn keyword kplOperator     alloc
syn keyword kplOperator     arraySize
syn keyword kplOperator     asInteger
syn keyword kplOperator     PtrTo
syn keyword kplOperator     isInstanceOf
syn keyword kplOperator     isKindOf
syn keyword kplOperator     free
syn keyword kplOperator     new
syn keyword kplOperator     self
syn keyword kplOperator     sizeOf
syn keyword kplOperator     super

syn keyword kplConstant     false
syn keyword kplConstant     null
syn keyword kplConstant     true


" Shamelessly adapted from c.vim
" I don't actually know what the "L" means in the patterns
syn region  kplString       start=+L\="+ skip=+\\\\\|\\"+ end=+"+
syn match   kplCharacter    "L\='[^\\]'"
syn match   kplConstant     "\<[[:upper:]_]\+\>"

hi def link kplComment      Comment
hi def link kplType         Type
hi def link kplStatement    Statement
hi def link kplString       String
hi def link kplCharacter    Character
hi def link kplOperator     Operator
hi def link kplConstant     Constant

let b:current_syntax = "kpl"

