runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set hlsearch
let g:solarized_termcolors=256
set t_Co=16
" set number
" colorscheme desert
colorscheme solarized

set splitbelow
set splitright

" syntax highlighting
syntax on
au BufNewFile,BufRead *.r,*.R setf r " don't use rexx syntax
au BufNewFile,BufRead *.gv setf cpp " gv files look like c++
au BufNewFile,BufRead *.rabl setf ruby " rabl is just ruby

" indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
filetype plugin indent on

au FileType r setlocal tabstop=4 softtabstop=4 shiftwidth=4 " 4-space indentation for R
let g:vimrplugin_assign=0

" cut/copy/paste
nnoremap <space> :let @+=@0<CR>

" tslime (still experimenting)
vmap <CR> <Plug>SendSelectionToTmux
"nmap <C-c><C-c> <Plug>NormalModeSendToTmux
"nmap <C-c>r <Plug>SetTmuxVars

" local
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
