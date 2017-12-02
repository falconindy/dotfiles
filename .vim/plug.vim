"
" Vim plugin management
"

call plug#begin()
Plug 'valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --gocode-completer' }
let g:ycm_global_ycm_extra_conf="/home/noclaf/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

Plug 'scrooloose/syntastic'
" let g:syntastic_sh_sh_args="-n -O extglob"

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'altercation/vim-colors-solarized'
Plug 'stephpy/vim-yaml'
Plug 'nsf/gocode'
Plug 'cstrahan/vim-capnp'
Plug 'fatih/vim-go'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rhysd/vim-clang-format'
call plug#end()

let g:clang_format#style = "google"
