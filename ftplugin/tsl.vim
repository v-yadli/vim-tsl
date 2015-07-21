" Vim filetype plugin file
" Language:	Trinity Specification Language
" Maintainer:	Yatao Li<yatao.li@live.com>
" Latest Revision: 21 July 2015

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1
let s:keepcpo= &cpo
set cpo&vim

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://

if has("gui_win32") && !exists("b:browsefilter")
    let b:browsefilter = "TSL Source Files (*.tsl)\t*.tsl\n" .
		       \ "All Files (*.*)\t*.*\n"
endif

let &cpo = s:keepcpo
unlet s:keepcpo
