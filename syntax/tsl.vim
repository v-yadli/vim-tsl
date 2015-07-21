" Vim syntax file
" Language: Trinity Specification Language
" Maintainer: Yatao Li
" Latest Revision: 21 July 2015

if exists("b:current_syntax")
    finish
endif

let s:cs_cpo_save = &cpo
set cpo&vim


" type
syn keyword tslType			bool byte char decimal double float int long object sbyte short string uint ulong ushort stream void
" construct
syn keyword tslConstruct    enum struct cell protocol server proxy 
" container
syn keyword tslContainer    List
" modifier
syn keyword tslModifier	    optional

" attributes
syn region tslAttribute     start="\["    end="\]"

" Comments
"
" PROVIDES: @tslCommentHook
"
syn keyword tslTodo		contained TODO FIXME XXX NOTE
syn region  tslComment		start="/\*"  end="\*/" contains=@tslCommentHook,tslTodo,@Spell
syn match   tslComment		"//.*$" contains=@tslCommentHook,tslTodo,@Spell

" Strings and constants
syn match   tslSpecialError	contained "\\."
syn match   tslSpecialCharError	contained "[^']"
" [1] 9.4.4.4 Character literals
syn match   tslSpecialChar	contained +\\["\\'0abfnrtvx]+
" unicode characters
syn match   tslUnicodeNumber	+\\\(u\x\{4}\|U\x\{8}\)+ contained contains=tslUnicodeSpecifier
syn match   tslUnicodeSpecifier	+\\[uU]+ contained
syn region  tslVerbatimString	start=+@"+ end=+"+ skip=+""+ contains=tslVerbatimSpec,@Spell
syn match   tslVerbatimSpec	+@"+he=s+1 contained
syn region  tslString		start=+"+  end=+"+ end=+$+ contains=tslSpecialChar,tslSpecialError,tslUnicodeNumber,@Spell
syn match   tslCharacter	"'[^']*'" contains=tslSpecialChar,tslSpecialCharError
syn match   tslCharacter	"'\\''" contains=tslSpecialChar
syn match   tslCharacter	"'[^\\]'"
syn match   tslNumber		"\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   tslNumber		"\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   tslNumber		"\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   tslNumber		"\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" The default highlighting.
hi def link tslType			Type
hi def link tslConstruct	Keyword
hi def link tslModifier		StorageClass
hi def link tslContainer    Function
hi def link tslAttribute    Constant

hi def link tslTodo			Todo
hi def link tslComment		Comment

hi def link tslSpecialError		Error
hi def link tslSpecialCharError		Error
hi def link tslString			String
hi def link tslVerbatimString		String
hi def link tslVerbatimSpec		SpecialChar
hi def link tslPreCondit			PreCondit
hi def link tslCharacter			Character
hi def link tslSpecialChar		SpecialChar
hi def link tslNumber			Number
hi def link tslUnicodeNumber		SpecialChar
hi def link tslUnicodeSpecifier		SpecialChar

let b:current_syntax = "tsl"

let &cpo = s:cs_cpo_save
unlet s:cs_cpo_save

" vim: ts=8
