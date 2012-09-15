
set nocompatible

syntax on

set encoding=utf-8
set fileencodings=utf-8

" use 256 colors
set t_Co=256
set background=dark
colorscheme molokai

set autoread
set nobackup
set noswapfile

set ruler
set number
set showcmd
set showmatch
set laststatus=2
set wildmenu
set wildmode=full

set scrolloff=20

set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

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

