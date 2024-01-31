set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nu
set splitbelow
set splitright
set mouse=i
syntax on
colorscheme slate

"keymap
let mapleader = " "
nnoremap <leader>e :Ex<Cr>

"system clipboard
"use vim comes with gvim on archlinux
"beacuse vim installed with pacman disable system clipboard
set clipboard=unnamedplus
"set cut copy and paste
"system
vnoremap <leader>y "+y
vnoremap <leader>d "+d
nnoremap <leader>p "+p
"buffer
vnoremap <leader>Y "*y
vnoremap <leader>D "*d
nnoremap <leader>P "*p


"move lines use ctrl-shift j/k
nnoremap <S-C-j> :m .+1<CR>==
nnoremap <S-C-k> :m .-2<CR>==
inoremap <S-C-j> <Esc>:m .+1<CR>==gi
inoremap <S-C-k> <Esc>:m .-2<CR>==gi
vnoremap <S-C-j> :m '>+1<Cr>gv=gv
vnoremap <S-C-k> :m '<-2<Cr>gv=gv

