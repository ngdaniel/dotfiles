syntax on
filetype plugin on

set timeoutlen=1000 ttimeoutlen=0

set autoread
set clipboard=unnamedplus
set background=dark

set mouse=a
set rnu
set nu

set incsearch
set ignorecase 
set smartcase
set hlsearch

set nobackup
set nowb
set noswapfile

set autoindent
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
set scrolloff=8

set tags=tags;/

nmap \o :set paste!<CR>
nmap \q :nohlsearch<CR>

nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

nnoremap <f9> :tabe %:p:h<cr>
