"
" .vimrc
" Dave Reisner
"

set nocompatible                "Needs to be first according to Bram

" General Options
"---------------------------------
set autoread
set backspace=indent,eol,start
set backupcopy=yes                     " keep attributes of original file
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupskip=/tmp/*
set completeopt=longest,menuone
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap
set expandtab
set history=50
set hlsearch
set ignorecase
set incsearch
set number
set printoptions=left:5pc,right:5pc,top:5pc,bottom:10pc,syntax:n
set ruler
set scrolloff=5
set shiftwidth=2
set shortmess=atI
set showcmd
set showmatch
set showmode
set shell=/bin/bash
set smartcase
set smartindent
set smarttab
set tabstop=2
set title
set virtualedit=all
set wildmenu
set wildmode=list:longest,full

filetype plugin indent on


" extra colors
"---------------------------------
syntax on
colorscheme dante
hi Pmenu ctermfg=Cyan ctermbg=Blue
hi PmenuSel ctermfg=White ctermbg=DarkYellow


" variables
"---------------------------------
let maplocalleader = ","



" keymapping
"---------------------------------
map Q gq
map <LocalLeader>t <Esc>:tabnew<CR>
map <LocalLeader>1  1gt
map <LocalLeader>2  2gt
map <LocalLeader>3  3gt
map <LocalLeader>4  4gt
map <LocalLeader>5  5gt
map <LocalLeader>6  6gt
map <LocalLeader>7  7gt
map <LocalLeader>8  8gt
map <LocalLeader>9  9gt

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

vmap <LocalLeader>y "+y
vmap <LocalLeader>p "+p
vmap <LocalLeader>c :call CommentLines()<CR>

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map <LocalLeader>l :Tlist<CR>

" Session Control
"--------------------------------
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"


" Tab/Indent Exceptions
"---------------------------------
autocmd FileType make set noexpandtab
autocmd FileType python set shiftwidth=4 tabstop=4


" Commenting
"---------------------------------
" default comment symbol
let g:StartComment="#"
let g:EndComment=""

" example of changing it for a filetype
au FileType c,cpp,go  let g:StartComment = "//"
au FileType vim       let g:StartComment = "\""

" call the function on ,c
vmap <LocalLeader>c :call CommentLines()<CR>

" and the function itself
function! CommentLines()
  try
    execute ":s@^".g:StartComment."@\@g"
    execute ":s@".g:EndComment."$@@g"
  catch
    execute ":s@^@".g:StartComment."@g"
    execute ":s@$@".g:EndComment."@g"
  endtry
endfunction


" Code Folding
"---------------------------------
if has ('folding')
  set foldenable
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldcolumn=0
endif



" Statusline
"---------------------------------
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/home/noclaf', "~", "g")
    return curdir
endfunction

set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


" Substitutions
"---------------------------------
if &term !=# "linux"
    set list listchars=tab:\»\ ,trail:·,extends:›,precedes:‹
endif



" Go
"--------------------------------
au BufRead,BufNewFile *.go set filetype=go


" Vala
"--------------------------------
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
let vala_ignore_valadoc = 1
let vala_comment_strings = 1
let vala_space_errors = 1
let vala_no_trail_space_error = 1
let vala_no_tab_space_error = 1
let vala_minlines = 120


" Mutt
"--------------------------------
au BufRead /tmp/mutt-* set tw=72

