set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" End of Vundle

execute pathogen#infect()

syntax enable

"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized

" let g:airline_theme='papercolor'
set t_Co=256
set background=dark
colorscheme PaperColor

" Tab completion
function! My_Tab_Completion()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-P>"
  else
    return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>

" Defaults
set history=50
set bs=2
set autoindent
set ruler
set nu
set hlsearch
set clipboard=unnamed,unnamedplus
set mouse=a
set shiftwidth=2
set expandtab
set shiftround
set autoread
set autowrite
set incsearch
set ignorecase
set smartcase
set cursorline

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to 'plaintex' instead of 'tex', which results in vim-latex not being loaded. The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Disable folding for latex-suite
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Remove trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e

" Highlight 80 char lines
highlight ColorColumn ctermbg=darkgray
set colorcolumn=80

