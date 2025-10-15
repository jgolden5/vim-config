syntax on
set tabstop=2 "set number of spaces that tab counts for (aka. tab length)
set sw=2
set matchpairs+=<:> "count <> as matches with '%' motion
set expandtab
set showcmd
set number
set wildmenu
set background=dark
command W write
command Wn wnext
command WN wnext

nnoremap <Space> <Nop> "this allows for space to be used exclusively as the leader key
let mapleader = " "
set notimeout

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap ZA :qa<CR>
