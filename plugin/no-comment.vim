" no-comment.vim - Minimal commenting for vim
" Maintainer: Brendan Ritchie <https://github.com/bhritchie>
" Version: 0.0.1

if exists("g:loaded_no_comment") || &cp || v:version < 700
  finish
endif
let g:loaded_no_comment = 1

if !exists("g:no_comment_strings")
  finish
endif

function! s:comment_line()
  if empty(&filetype)
    echo "No Comment: filetype is not defined."
  elseif !has_key(g:no_comment_strings, &filetype)
    echo "No Comment: no comment string is defined for filetype " . &filetype
  else
    if getline(line(".")) =~? '\v(\s*)?^(\s*)?' . g:no_comment_strings[&filetype] . '(\s*)?'
      " remove the comment string, leaving indentation in place
      execute "normal! mx^:" . 's/\v' . g:no_comment_strings[&filetype] . '(\s*)?//' . "\<cr>`xhh"
    else
      execute "normal! mxI" . g:no_comment_strings[&filetype] .  " \<esc>`xll"
    endif
  endif
endfunction

command! NoComment call s:comment_line()
