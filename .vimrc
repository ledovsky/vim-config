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

" Powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Python
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'

" Better editing
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'

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
" se mouse+=a
se mouse=r
filetype plugin on    " required by Vundle

" Disable backup and swop files
set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/ipynb_checkpoint/*

" == Editing Setup ==

let mapleader=","
set incsearch
set ic

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
vmap "+y :!xclip -f -sel clip<CR>
map "+p :r!xclip -o -sel clip<CR>

" Auto remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" == Indentation Setup ==

set expandtab
set softtabstop=4
set shiftwidth=4

" == Visual Setup ==

syntax on
set nu

set background=dark

if has('gui_running')
    color base16-ocean
    let g:airline_theme='base16_ocean'
else
    color jellybeans
    let g:airline_theme='jellybeans'
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Setup NETRW
let g:netrw_liststyle=1
set hidden

" == Plugin setup ==

" NERD Tree setup
let NERDTreeIgnore = ['\.pyc$']
ab nt NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>


" Vim markdown - disable folding
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippents ="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
" let g:UltiSnipsJumpBackwardTrigger="<c-w>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Buffers
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>f :b



" CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0


" JEDI
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 2

" Python-mode
let g:pymode_rope = 0

let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_lint_cwindow = 0

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 0
