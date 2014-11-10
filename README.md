# No Comment

Minimal line commenting for Vim.

## Usage

A single new command is provided by this plugin:

    :NoComment

This command comments out the current line by adding a comment string to the beginning of it. It is assumed that the user will want to create a mapping for this. For example:

    nnoremap <leader>c :NoComment<cr>

No Comment does not itself know any comment strings. The user must define define a `g:no_comment_string` dictionary, mapping desired filetypes to comment strings. For example:

    let g:no_comment_strings = {"vim": '"', "coffee": '#'}

No Comment can be disabled by adding the following line to your .vimrc:

    let g:loaded_no_comment = 1

### Sample Configuration

A web developer might start with something like this in his .vimrc:

    nnoremap <leader>c :NoComment<cr>
    let g:no_comment_strings = {
      \ "vim": '"',
      \ "ruby": '#',
      \ "coffee": '#',
      \ "scss": '//'
      \ }

## Plans

At a minimum, :NoComment will eventually act a toggle, and will work on multiple lines in visual mode. A help file will be added.

## Installation

With [Pathogen](https://github.com/tpope/vim-pathogen): `cd ~/.vim/bundle && git clone git://github.com/bhritchie/no-comment.git`.

With [Vundle](https://github.com/gmarik/Vundle.vim): add `Plugin 'bhritchie/no-comment'` to your list of Vundle plugins in your .vimrc and run `:PluginInstall`.


## License

[MIT](http://opensource.org/licenses/MIT).
