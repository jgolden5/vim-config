syntax on
set fileencoding=utf-8
set tabstop=2 "set number of spaces that tab counts for (aka. tab length)
set sw=2
set matchpairs+=<:> "count <> as matches with '%' motion
set expandtab
set showcmd
set number
set wildmenu
set background=dark
command! W write
command! Wn wnext
command! WN wnext
highlight CursorColumn ctermbg=white

nnoremap <Space> <Nop>
let mapleader = " "
set notimeout "any keys part of a multi-key keymapping will wait indefinitely for the next key until a match or an interrupt
set ttimeout "terminal keys (builtin special chars not requiring an additional keypress, such as escape) will time out as indicated by ttimeoutlen var
set ttimeoutlen=500

"generic movement helps
nnoremap <Leader>i ggVG:s/    /  /g<CR>

"page navigation
nnoremap <Leader>d <C-d>zz
nnoremap <Leader>u <C-u>zz
nnoremap <Leader>f <C-f>zz
nnoremap <Leader>b <C-b>Hzz

"filesystem manipulation
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>X :xa<CR>
nnoremap ZA :xa<CR>
nnoremap <Leader>Q ZQ
nnoremap <Leader>E :wa<CR>:windo e<CR>
nnoremap <Leader>e :w<CR>viWy:e <C-r>0<CR>:echo "remember you can switch between files with Leader+o or Ctl+^"<CR>
nnoremap <Leader>s viWy:split <C-r>0<CR>
nnoremap <Leader>S viWy:vsplit <C-r>0<CR>

"window/pane navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L
nnoremap <Leader>r <C-w>r
nnoremap <Leader>= <C-w>=
nnoremap <Leader>o :w<CR><C-^>

"tab navigation
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>te viWy:tabnew <C-r>0<CR>
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tO :tab split<CR>gT:x<CR>gt
nnoremap K :tabnext<CR>
nnoremap J :tabprevious<CR>
nnoremap <Leader>t> :tabmove<CR>
nnoremap <Leader>1 :tabn 1<CR>
nnoremap <Leader>2 :tabn 2<CR>
nnoremap <Leader>3 :tabn 3<CR>
nnoremap <Leader>4 :tabn 4<CR>
nnoremap <Leader>5 :tabn 5<CR>
nnoremap <Leader>6 :tabn 6<CR>
nnoremap <Leader>7 :tabn 7<CR>
nnoremap <Leader>8 :tabn 8<CR>
nnoremap <Leader>9 :tabn 9<CR>

"keymap settings
nnoremap <Leader>mh :set hlsearch<CR>
nnoremap <Leader>mH :set nohlsearch<CR>
nnoremap <Leader>mn :set number<CR>
nnoremap <Leader>mN :set nonumber<CR>
nnoremap <Leader>mr :set relativenumber<CR>
nnoremap <Leader>mR :set norelativenumber<CR>

"copy/paste/clipboard
nnoremap <Leader>ya mmggVG"+y'mzz:echo "copied entire current file '<C-r>%' to the clipboard"<CR>
nnoremap <Leader>yl :t.<Left><Left>
nnoremap <Leader>yp mmvap"+y'm:echo "copied paragraph to clipboard"<CR>
nnoremap <Leader>yw viW"+y:echo "copied current word to clipboard"<CR>
nnoremap <Leader>yy V"+y:echo "copied current line to clipboard"<CR>
nnoremap <Leader>y$ v$h"+y:echo "copied current line (cursor to end of line) to clipboard"<CR>
nnoremap <Leader>y% :let @+ = @%<CR>:echo "copied file name '<C-r>%' to the clipboard"<CR>
nnoremap <Leader>y} V}"+y:echo "copied from current line to end of paragraph to clipboard"<CR>
nnoremap <Leader>p "+p:echo "pasted from clipboard"<CR>
nnoremap <Leader>P "+P:echo "pasted from clipboard"<CR>
vnoremap <Leader>x "+d:echo "cut current selection to the clipboard"<CR>

"open something from vim
nnoremap <Leader>% :!open <C-r>%<CR><CR>
nnoremap <Leader>G :!open "https://www.google.com/search?q="<Left>
nnoremap <Leader>g viW"+y:!open $(pbpaste)<CR><CR>

"visual mode
vnoremap <Leader>y "+y
vnoremap <Leader>c "+y
vnoremap <C-c> "+y:echo "copied the following to clipboard: <C-r>+"<CR>
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
vnoremap <C-v> "+p
vnoremap <Leader>g "+y:!open "https://www.google.com/search?q=<C-r>+"<CR><CR>
vnoremap <Leader>s "+y:!open $(pbpaste)<CR><CR>
vnoremap <Leader>i :s/    /  /g<CR>

"AI keymaps
nnoremap <Leader>A? :echo system("grep 'noremap .Leader.A' ~/.vimrc")<CR>
nnoremap <Leader>A1 :!open "https://www.chatgpt.com/?q="<Left>
nnoremap <Leader>A2 :!open "https://grok.com/?q="<Left>
nnoremap <Leader>A3 :echo "sorry, Gemini's AI makes it too tricky to copy paste to it from vim :( Type A? for a list of valid AI fill-in searches"<CR>
nnoremap <Leader>A4 :!open "https://claude.ai/new?q="<Left>
nnoremap <Leader>A5 :!open "https://chat.mistral.ai/chat/?q="<Left>
nnoremap <Leader>A6 :echo "sorry, Meta's AI makes it too tricky to copy paste to it from vim :( Type A? for a list of valid AI fill-in searches"<CR>
nnoremap <Leader>A7 :echo "sorry, Copilot's URL makes it too tricky to copy paste to it from vim :( Type A? for a list of valid AI fill-in searches"<CR>
nnoremap <Leader>A8 :!open "https://www.perplexity.ai/?q="<Left>
nnoremap <Leader>A9 :!open "https://www.perplexity.ai/?q="<Left>
vnoremap <Leader>A1 "+y:!open "https://www.chatgpt.com/?q=<C-r>+"<Left>
vnoremap <Leader>A2 "+y:!open "https://grok.com/?q=<C-r>+"<Left>
vnoremap <Leader>A4 "+y:!open "https://claude.ai/new?q=<C-r>+"<Left>
vnoremap <Leader>A5 "+y:!open "https://chat.mistral.ai/chat/?q=<C-r>+"<Left>
vnoremap <Leader>A8 "+y:!open "https://www.perplexity.ai/?q=<C-r>+"<Left>
vnoremap <Leader>a? :echo system("grep 'noremap .Leader.a' ~/.vimrc")<CR>
vnoremap <Leader>a1 "+y:!open "https://www.chatgpt.com/?q=<C-r>+" && echo "Copied text to Chat Gippity"<CR><CR>
vnoremap <Leader>a2 "+y:!open "https://grok.com/?q=<C-r>+" && echo "Copied text to Grok"<CR><CR>
vnoremap <Leader>a3 "+y:!open "https://gemini.google.com/app"<CR> && echo "Copied text to Gemini"<CR><CR>
vnoremap <Leader>a4 "+y:!open "https://claude.ai/new?q=<C-r>+" && echo "Copied text to Claude"<CR><CR>
vnoremap <Leader>a5 "+y:!open "https://chat.mistral.ai/chat/?q=<C-r>+" && echo "Copied text to Mistral"<CR><CR>
vnoremap <Leader>a6 "+y:!open "https://meta.ai/"<CR> && echo "Copied text to Mistral"<CR><CR>
vnoremap <Leader>a7 "+y:!open "https://www.copilot.com/"<CR> && echo "Copied text to copilot"<CR><CR>
vnoremap <Leader>a8 "+y:!open "https://www.perplexity.ai/?q=<C-r>+" && echo "Copied text to copilot"<CR><CR>

"Python
autocmd BufRead,BufNewFile *.py,*.squash call ToggleIndentationVisualization()
function! ToggleIndentationVisualization()
  let w:pretty = 'tab:>-,leadmultispace:| '
  if &listchars ==# w:pretty
    set nolist
    set listchars =
  else
    set list
    let &listchars = w:pretty
  endif
endfunction
nnoremap <Leader>Pi :call ToggleIndentationVisualization()<CR>
nnoremap <Leader>P? :echo system("grep 'noremap .Leader.P' ~/.vimrc")<CR>

"Enter search mode for something case-insensitive
nnoremap <Leader>/ /\c<Left><Left>

"inline bash keymaps
nnoremap !@ :%!
nnoremap !# ggO#!/bin/bash<Esc>j0
nnoremap <Leader>; mm:%!sed -E 's/[^;{}\*\/\\: ]$/&;/'<CR>'m

function! FlashCursor()
  set cursorline
  set cursorcolumn
  call timer_start(500, {-> execute('set nocursorline | set nocursorcolumn')})
endfunction

"cursor
nnoremap <Leader><Leader> :call FlashCursor()<CR>

"map helps
nnoremap <Leader>? :echo system("grep 'noremap .Leader.' ~/.vimrc")<CR>

"fold keymaps
nnoremap <Leader>z? :help zf<CR>
