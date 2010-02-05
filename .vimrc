"
" ViM Runtime Configuration
"
" Author: Dave Reisner (Falcon Industries)
"
set nocompatible                "Needs to be first according to Bram

" AMG the colors!
"---------------------------------
syntax on
colorscheme dante

" General Options
"---------------------------------
set autoindent
set backspace=indent,eol,start
set completeopt=longest
set history=50
set incsearch
set number
set printoptions=left:5pc,right:5pc,top:5pc,bottom:10pc
set ruler
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smarttab
set tabstop=4
set title
set virtualedit=all

" Tab Settings
"---------------------------------
autocmd FileType * set expandtab
autocmd FileType make set noexpandtab

" Code Folding
"---------------------------------
if has ('folding')
  set foldenable
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldcolumn=0
endif


" Key mappings
"---------------------------------
map Q gq
map C :s/^/#/
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>


" Statusline
"---------------------------------
    set laststatus=2

    function! CurDir()
        let curdir = substitute(getcwd(), '/home/haruko/', "~/", "g")
        return curdir
    endfunction

  "Format the statusline
     set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


" Substitutions
"---------------------------------
if &term !=# "linux"
    set list listchars=tab:\➜\ ,trail:·,nbsp:-
endif
