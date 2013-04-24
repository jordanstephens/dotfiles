
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

syntax on

set encoding=utf-8
set fileencodings=utf-8

" use 256 colors
set t_Co=256
set background=dark
colorscheme molokai
set guifont=Monaco:h16

set autoread
set nobackup
set noswapfile

set history=1000

set ruler
set number
set showcmd
set showmatch
set laststatus=2
set wildmenu
set wildmode=full

set scrolloff=20

set expandtab
set autoindent
set shiftwidth=2
set tabstop=2

autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

set incsearch
set ignorecase
set smartcase
set hlsearch

set t_vb=
set visualbell

set splitbelow
set splitright

" Strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ','

" less tedious mapping for tComment
map <leader>/ <c-_><c-_>

" move up and down by visual lines rather than by actual file lines
nmap j gj
nmap k gk

" clear highlighting with the return key
nnoremap <return> :noh<return><esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"
" Stolen from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<return>
inoremap <s-tab> <c-p>

