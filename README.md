# No Comment

Minimal line commenting for Vim.

## Usage

A single new command is provided by this plugin:

    :NoComment

This command is a toggle for commenting out the current line. The user will likely want to create a mapping for it. For example:

    nnoremap <leader>c :NoComment<cr>

No Comment does not itself know any comment strings. The user must define define a `g:no_comment_string` dictionary, mapping desired filetypes to comment strings. For example:

    let g:no_comment_strings = {"vim": '"', "coffee": '#'}

Some languages, such as HTML, require an opening and closing string for a comment. For these languages, map a dictionary containing `open` and `close` keys. Extending the previous example:

    let g:no_comment_strings = {"vim": '"', "coffee": '#', "html": {"open": '<!--', "close": '-->'}}

No Comment can be disabled by adding the following line to your .vimrc:

    let g:loaded_no_comment = 1

### Sample Configuration

A web developer might start with something like this in his .vimrc:

    nnoremap <leader>c :NoComment<cr>
    let g:no_comment_strings = {
      \ "vim": '"',
      \ "ruby": '#',
      \ "coffee": '#',
      \ "html": {"open":'<!--', "close":'-->'},
      \ "scss": '//'
      \ }

## Plans

The :NoComment command will eventually work in visual mode for commenting out multiple lines, and a help file will be added.

## Installation

With [Pathogen](https://github.com/tpope/vim-pathogen): `cd ~/.vim/bundle && git clone git://github.com/bhritchie/no-comment.git`.

With [Vundle](https://github.com/gmarik/Vundle.vim): add `Plugin 'bhritchie/no-comment'` to your list of Vundle plugins in your .vimrc and run `:PluginInstall`.


## License

[MIT](http://opensource.org/licenses/MIT).
