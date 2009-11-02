" Vim syntax file
" Language:     KPL (Kernel Programming Language)
" Maintainer:   Wil Cooley <wcooley@nakedape.CC>
" Filenames:    *.c, *.h (conflicts of course, with C)
"

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn match kplComment "[-][-].*"

" syn keyword kpl

syn keyword kplType array
syn keyword kplType anyType
syn keyword kplType bool
syn keyword kplType char
syn keyword kplType double
syn keyword kplType enum
syn keyword kplType int
syn keyword kplType typeOfNull
syn match   kplType "ptr to"
syn keyword kplType void
syn keyword kplType record
syn keyword kplType endRecord

syn keyword kplStatement behavior endBehavior
syn keyword kplStatement class endClass
syn keyword kplStatement code endCode
syn keyword kplStatement function endFunction
syn keyword kplStatement header endHeader
syn keyword kplStatement infix
syn keyword kplStatement interface endInterface
syn keyword kplStatement method endMethod
syn keyword kplStatement prefix

syn keyword kplStatement break
syn keyword kplStatement by
syn keyword kplStatement case
syn keyword kplStatement catch
syn keyword kplStatement const
syn keyword kplStatement continue
syn keyword kplStatement debug
syn keyword kplStatement default
syn keyword kplStatement do

syn keyword kplStatement if
syn keyword kplStatement else
syn keyword kplStatement elseIf
syn keyword kplStatement endIf

syn keyword kplStatement endFor
syn keyword kplStatement endSwitch
syn keyword kplStatement endTry
syn keyword kplStatement endWhile

syn keyword kplStatement errors
syn keyword kplStatement extends
syn keyword kplStatement external
syn keyword kplStatement fields
syn keyword kplStatement for
syn keyword kplStatement free
syn keyword kplStatement implements
syn keyword kplStatement messages
syn keyword kplStatement methods
syn keyword kplStatement of
syn keyword kplStatement ptr
syn keyword kplStatement renaming
syn keyword kplStatement return
syn keyword kplStatement returns
syn keyword kplStatement superclass
syn keyword kplStatement switch
syn keyword kplStatement throw
syn keyword kplStatement to
syn keyword kplStatement try
syn keyword kplStatement type
syn keyword kplStatement until
syn keyword kplStatement uses
syn keyword kplStatement var
syn keyword kplStatement while

hi def link kplComment Comment
hi def link kplType Type
hi def link kplStatement Statement


let b:current_syntax = "kpl"

