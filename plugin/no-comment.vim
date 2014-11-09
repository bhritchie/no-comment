" no-comment.vim - Minimal commenting for vim
" Maintainer: Brendan Ritchie <https://github.com/bhritchie>
" Version: 0.0.1

if exists("g:loaded_no_comment") || &cp || v:version < 700
  finish
endif
let g:loaded_no_comment = 1

function! s:comment_line()
  echom "You called comment_line"
endfunction

call s:comment_line()
