" ===== VUNDLE SETUP =====

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin 'jmcantrell/vim-virtualenv'

Plugin 'tpope/vim-vinegar.git'

Plugin 'lervag/vimtex'

Plugin 'stephpy/vim-yaml'
Plugin 'exu/pgsql.vim'

" Navigation
" Plugin 'scrooloose/nerdTree'
Plugin 'jlanzarotta/bufexplorer'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'tpope/vim-vinegar'

Plugin 'kien/ctrlp.vim'
" Plugin 'tmhedberg/SimpylFold'

" Powerline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'bling/vim-bufferline'
" Plugin 'airblade/vim-gitgutter'


" Snippets
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" Linting
Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'

" Code completion
" Plugin 'Valloric/YouCompleteMe'
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

Plugin 'reedes/vim-colors-pencil'
Plugin 'dracula/vim'

" Visual
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'endel/vim-github-colorscheme'
" Plugin 'vim-scripts/github-theme'

" Syntax Specific
Plugin 'mattn/emmet-vim'
" Plugin 'vim-scripts/indentpython.vim'

Plugin 'jmcantrell/vim-virtualenv'

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
    " color base16-ocean
    " color pencil
    " let g:airline_theme='pencil'

    " set background=light
    color github
    " let g:airline_theme='base16_solarized'
    " color Tomorrow-Night
    " let g:airline_theme='tomorrow'

    " color Tomorrow
    " let g:airline_theme='tomorrow'

    "
    " color dracula
    " let g:airline_theme='dracula'
else
    " color Tomorrow
    " color pencil
    " let g:airline_theme='pencil'
    color Tomorrow
    " let g:airline_theme='tomorrow'
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Setup NETRW
let g:netrw_liststyle=1

set hidden

" == Plugin setup ==

" Syntastic set up

let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": ["cpp", "tex"]}

let g:syntastic_cpp_checkers=['gcc', 'cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_tex_checkers= ['chktex']

let g:syntastic_tex_chktex_quiet_messages = {
    \ "regex": 'You should enclose' }

" Airline should make changes automatically
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_check_on_wq = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1


let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args='--ignore=E501'


" NERD Tree setup
" let NERDTreeIgnore = ['\.pyc$']
" ab nt NERDTreeToggle
" map <C-n> :NERDTreeToggle<CR>

" Ctrl-P Plugin Setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Vim markdown - disable folding
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" YouCompleteMe
let g:ycm_python_binary_path = 'python'
" let g:ycm_python_binary_path = '/data/conda/bin/python'


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
set laststatus=2


map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>f :b
map <Leader>w :bdelete

map <Leader>e :Explore<Return>
map <Leader>t :tabnew<Return>

let g:netrw_altv=1
set ic
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/ipynb_checkpoint/*

" let g:virtualenv_directory = '/home/ledovsky/virtualenvs/'
" autocmd FileType netrw setl bufhidden=delete
" autocmd FileType netrw setl bufhidden=wipe

let g:ctrlp_working_path_mode = 0


let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_lint_cwindow = 0

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let g:virtualenv_directory = '~'

" Postgres settings
let g:sql_type_default = 'pgsql'

let g:tex_flavor = "latex"

" set tabline=
