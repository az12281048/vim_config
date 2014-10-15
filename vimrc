set nocompatible      " We're running Vim, not Vi!
set guifont=*
set guifont=Monaco\ 20
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" VUNDLE BEGIN
" ============

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails.git'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
"Bundle 'solarnz/thrift.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
"Bundle 'sketch.vim'
" 希望换成更好的注释工具
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-repeat'
Bundle 'jcf/vim-latex'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'greyblake/vim-preview'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'fatih/molokai'

"http://www.vim.org/scripts/script.php?script_id=40
Bundle 'https://github.com/vim-scripts/DrawIt.git'

"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'taglist.vim'
Bundle 'Specky'
Bundle 'matchit.zip'
Bundle 'Mark--Karkat'
Bundle 'bufexplorer.zip'
Bundle 'grep.vim'
Bundle 'ZoomWin'

" VUNDLE END
" ==========

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

set autoindent
set hlsearch
set incsearch
set number
set expandtab
set ruler
set nobackup
set showcmd
set wrap
"set autochdir
"set cursorcolumn
"set cursorline
set tabstop=2 shiftwidth=2 softtabstop=2
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set laststatus=2
"set linespace=0 " No extra spaces between rows"
set wildmenu " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.

set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 " 如果你要打开的文件编码不在此列，那就添加进去
set termencoding=utf-8

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

let g:vim_markdown_folding_disabled=1

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
noremap <silent> <leader>v v$h
nnoremap K k

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


" sudo apt-get install ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let g:SuperTabDefaultCompletionType = "<c-n>"

" CTRL-P BEGIN
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_max_height = 30

augroup mkd
  autocmd BufRead *.mkd,*.markdown set ai formatoptions=tcroqn2 comments=n:>
augroup END

" 自己添加的运行ruby指令
let g:runRubyKey = "<leader>rr"
let g:toggleRubyCommentKey = "<leader>rc"
let g:Powerline_symbols = 'fancy'

"" txtbrowser
au BufRead,BufNewFile *.txt setlocal ft=ruby

set t_Co=256
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing

autocmd! filetype qf nnoremap <buffer> <leader>l <C-W><Enter><C-W>L


" ABBREVIATIONS START
" ==========

inoreabbr pry require "pry";binding.pry
iabbrev edn end
abbrev so source ~/.vimrc<CR>
noreabbr Q q
noreabbr W w
iabbr -p puts "--------------------------------------"

" ABBREVIATIONS END
" ==========
map <F3> :call ToggleSketch()<CR>

" MAPING START
" ==========

" tags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=.js --exclude=.css --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

" 窗口切换
noremap <silent> H <C-W><C-H>
noremap <silent> L <C-W><C-L>

" 跳转记录文件
nnoremap <silent> <leader><leader>r :e ~/Desktop/records/records.markdown<CR>

" 文件夹树和tag列表以及画图工具
noremap <silent> <leader>tt :NERDTreeToggle<CR>
noremap <silent> <F2> :NERDTreeFind<CR>
noremap <silent> <F3> :Tlist<CR>

" tabnew
nnoremap <silent> tt :tabnew<CR>
nnoremap <silent> <C-A> <Esc>ggVG
nnoremap <silent> = <C-I>
nnoremap <silent> - <C-O>

" 退出和保存
nnoremap <C-S> :w<CR>
nnoremap <C-Q> :q<CR>

" 复制粘贴
noremap <silent> <leader>p "+p
noremap <silent> <leader>y "+y

"" 快速查找
noremap <silent> <leader>ff :FufFile!<CR>
noremap <silent> <leader>fa :FufCoverageFile!<CR>
noremap <silent> <leader>fb :FufBuffer!<CR>
noremap <silent> <leader>fd :FufDir!<CR>
noremap <silent> <leader>fm :FufMruFile!<CR>
noremap <silent> <leader>fw :FufFileWithCurrentBufferDir!<CR>
noremap <silent> <leader>fc :FufMruCmd!<CR>

""Git相关
noremap <silent> <leader>df :Gdiff<CR>
noremap <silent> <leader>gb :Gblame<CR>
noremap <silent> <leader>gs :Gstatus<CR>

" 其他
nnoremap <silent> K k
nnoremap <silent> U u

" for latex
inoremap $<TAB> $$<ESC>i
inoremap \emph<TAB> \emph{}<ESC>i
inoremap {<TAB> {<SPACE>}<ESC>i<SPACE><ESC>i
inoremap (<TAB> ()<ESC>i
inoremap [<TAB> []<ESC>i
" MAPING END
" ==========

" 配色
"colorscheme railscasts
"colorscheme solarized
colorscheme molokai

