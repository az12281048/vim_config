set guioptions=
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 15
set guifont=Monaco\ 14
"colorscheme vividchalk
colorscheme railscasts
"colorscheme solarized
set showcmd
set wrap
behave mswin
let Tlist_Use_Right_Window=1
au BufRead,BufNewFile *.txt setlocal ft=ruby


nnoremap <silent> <C-A> <Esc>ggVG
nnoremap <silent> =  <C-I>
nnoremap <silent> -  <C-O>
" 退出和保存
nnoremap <C-S> :w<CR>
nnoremap <C-Q> :q<CR>
" 复制粘贴
noremap <silent> <leader>p "+p
noremap <silent> <leader>y "+y
