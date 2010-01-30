"
" ViM Runtime Configuration
"
" Author: Dave Reisner (Falcon Industries)
"

set nocompatible        " Don't be old and stupid
syntax on               " Syntax highlighting on
colorscheme dante
set tabstop=4
set shiftwidth=4
set smartindent          " Use current level line's indent
set showmatch           " Show matching braces
set virtualedit=all     " Allow cursor to stray outside text
set showcmd
set incsearch           " Search for text as entered
set number
set ruler

" I hate tabs with a fiery passion
autocmd FileType * set expandtab
autocmd FileType make set noexpandtab


""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq

" shift-c to comment (no <CR> so you have a chance to edit commentor)
map C :s/^/#/

" save the current file as root and reload
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
  "Always hide the statusline
    set laststatus=2

    function! CurDir()
        let curdir = substitute(getcwd(), '/home/haruko/', "~/", "g")
        return curdir
    endfunction

  "Format the statusline
     set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

"""""""""""""""""""""""""""""
" Substitutions
"""""""""""""""""""""""""""""
if &term !=# "linux"
    set list listchars=tab:\➜\ ,trail:·,nbsp:-
endif
