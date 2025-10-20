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

nnoremap <Space> <Nop>
let mapleader = " "
set notimeout "any keys part of a multi-key keymapping will wait indefinitely for the next key until a match or an interrupt
set ttimeout "terminal keys (builtin special chars not requiring an additional keypress, such as escape) will time out as indicated by ttimeoutlen var
set ttimeoutlen=500

nnoremap ZA :xa<CR>
nnoremap !@ :%!

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

nnoremap <Leader>d <C-d>zz
nnoremap <Leader>u <C-u>zz
nnoremap <Leader>f <C-f>zz
nnoremap <Leader>b <C-b>Hzz
