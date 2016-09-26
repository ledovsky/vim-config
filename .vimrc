" ===== VUNDLE SETUP =====

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Navigation
Plugin 'scrooloose/nerdTree'
Plugin 'jlanzarotta/bufexplorer'

Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'

" Snippets
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repolugin 'tpope/vim-surround'

" Linting
Plugin 'scrooloose/syntastic'

" Better editing
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" Visual
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'

" Syntax Specific
Plugin 'mattn/emmet-vim'
" Plugin 'vim-scripts/indentpython.vim'


call vundle#end()            " required



" ====== My Config ======


" == General Stuff ==
"
set nocp
set bs=indent,eol,start
se mouse+=a
filetype plugin on    " required by Vundle

" Disable backup and swop files
set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

" == Editing Setup ==

let mapleader=","
set incsearch

" Paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Russian lang support

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
inoremap <c-f> <c-^>

" UTF8 support
set encoding=utf-8

" Folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
nnoremap <space> za

" Better Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Command line completion
set wildmode=longest,list,full
set wildmenu

" Better line navigation
map j gj
map k gk

" Ctrl-C Ctrl-V with global buffer.
vnoremap <C-c> "+y
inoremap <C-v> <esc>"+p

" Auto remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" == Indentation Setup ==

set expandtab


" == Visual Setup ==

syntax on
set nu

set background=dark

if has('gui_running')
    color gruvbox
else
    color gruvbox
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" == Plugin setup ==

" Syntastic set up

let g:syntastic_mode_map = {"mode": "passive"}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_python_checker_args='--ignore=E501'

" NERD Tree setup
let NERDTreeIgnore = ['\.pyc$']
ab nt NERDTreeToggle

" Ctrl-P Plugin Setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Vim markdown - disable folding
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
