" no-comment.vim - Minimal commenting for vim
" Maintainer: Brendan Ritchie <https://github.com/bhritchie>
" Version: 0.0.1

" include a tiny default set of comment strings for ilustrative purpose
" make the mark configurable

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
    if type(g:no_comment_strings[&filetype]) == 1
      if getline(line(".")) =~? '\v(\s*)?^(\s*)?' . g:no_comment_strings[&filetype] . '(\s*)?'
        silent execute "normal! mx^:" . 's/\v' . g:no_comment_strings[&filetype] . '(\s*)?//' . "\<cr>`x" . repeat("h", len(g:no_comment_strings[&filetype]) + 1)
      else
        silent execute "normal! mxI" . g:no_comment_strings[&filetype] . " \<esc>`x" . repeat("l", len(g:no_comment_strings[&filetype]) + 1)
      endif
    elseif type(g:no_comment_strings[&filetype]) == 4
      if getline(line(".")) =~? '^' . g:no_comment_strings[&filetype].open
        silent execute "normal! mx^:" . 's/' . g:no_comment_strings[&filetype].open . ' *//' . "\<cr>"
        silent execute "normal! :" . 's/ *' . g:no_comment_strings[&filetype].close . '$//' . "\<cr>`x" . repeat("h", len(g:no_comment_strings[&filetype].open) + 1)
      else
        execute "normal! mxI" . g:no_comment_strings[&filetype].open . " \<esc>A " . g:no_comment_strings[&filetype].close . "\<esc>`x" . repeat("l", len(g:no_comment_strings[&filetype].open) + 1)
      endif
    endif
  endif
endfunction

command! NoComment call s:comment_line()
