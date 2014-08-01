" VUNDLE BEGIN
" ============
set nocompatible      " We're running Vim, not Vi!
set guifont=Monaco\ 15

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails.git'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
" 希望换成更好的注释工具
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rake'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'greyblake/vim-preview'
Bundle 'jpo/vim-railscasts-theme'
" F11全屏, F6 Open
Bundle 'xolox/vim-shell'
" make -f make_gcc.mak
Bundle 'Shougo/vimproc'
" 需要先安装vimproc
Bundle 'Shougo/vimshell'
" Bundle 'vimim/vimim'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'taglist.vim'
Bundle 'Specky'
Bundle 'matchit.zip'
" map了<lead>r，与rspec冲突
Bundle 'Mark--Karkat'
Bundle 'bufexplorer.zip'
Bundle 'grep.vim'
"Bundle 'AutoClose'
Bundle 'ZoomWin'
" Bundle 'GoogleReader.vim'
" Bundle 'dbext.vim'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

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

""augroup myfiletypes
""" Clear old autocmds in group
""autocmd!
""" autoindent with two spaces, always expand tabs
"autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
""augroup END
""noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" specky是一个为rspec测试提供方便的工具
let g:speckyBannerKey = "<leader>rb"
let g:speckyQuoteSwitcherKey = "<leader>r'"
let g:speckyRunRdocKey = "<leader>rd"
let g:speckySpecSwitcherKey = "<leader>rx"
let g:speckyRunSpecKey = "<leader>rs"
"let g:speckyRunSpecCmd = "spec -fs -r loadpath.rb"
let g:speckyRunSpecCmd = "spec -fs -c"
let g:speckyRunRdocCmd = "fri -L -f plain"
let g:speckyWindowType = 1

"" viki 用wiki的格式来记录信息的工具
"let g:vikiNameSuffix=".viki"
"let g:vikiUseParentSuffix = 1
"autocmd! BufRead,BufNewFile *.viki set filetype=viki

autocmd! BufRead,BufNewFile *.txt set filetype=viki

"初始窗口最大化
"au GUIEnter * simalt ~x

noremap <silent> <leader>v v$
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

" 窗口切换
noremap <silent> H <C-W><C-H>
noremap <silent> L <C-W><C-L>
" 文件夹树和tag列表以及画图工具
noremap <silent> <F1> :NERDTreeToggle<CR>
noremap <silent> <F2> :Tlist<CR>
" Commmand-T: 查找文件
noremap <silent> <F8> :CommandT<CR>
noremap <silent> <leader>ts :call ToggleSketch()<CR>
" tabnew
nnoremap <silent> tt :tabnew<CR>
nnoremap <silent> <C-A> <Esc>ggVG
nnoremap <silent> = <C-I>
nnoremap <silent> - <C-O>
" 退出和保存
nnoremap <C-S> :w<CR>
nnoremap <C-Q> :q<CR>

" sudo apt-get install ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" CTRL-P BEGIN
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_max_height = 30
"
" CTRL-P END

" Tabularize {
"if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
"endif
" }

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
" }

"" 使用空格翻页
"" nnoremap <silent> <space> <C-F>
"
"" 当处于wrap模式时，让通常的操作键作用于视觉上的行
"" 只有在set wrap? == 'nowrap' 的情况下才适用
""nnoremap <silent> j gj
""nnoremap <silent> k gk
""nnoremap <silent> 0 g0
""nnoremap <silent> $ g$
""nnoremap <silent> ^ g^
"
"augroup mkd
"  autocmd BufRead *.mkd,*.markdown set ai formatoptions=tcroqn2 comments=n:>
"augroup END

iabbrev -- --------------------
iabbrev === ==========
iabbrev ** **********
iabbrev ## #####
iabbrev WR !!!!! WARNING !!!!!
iabbrev PA #{PATH}/#{@project}
iabbrev edn end
abbrev so source ~/.vimrc
noreabbr Q q
noreabbr W w
" 自己添加的运行ruby指令
let g:runRubyKey = "<leader>rr"
let g:toggleRubyCommentKey = "<leader>rc"

let g:Powerline_symbols = 'fancy'

"" txtbrowser
au BufRead,BufNewFile *.txt setlocal ft=ruby
"
"" vimim begin
""
"" 只有在输入完按空格才显示输入法
"" let g:vimim_static_input_style = 2
"" let g:vimim_static_input_style = 0
"
"" 为-1时不调用云输入法
"" let g:vimim_cloud_sogou = -1
"" 5个字符以上查找搜狗
"let g:vimim_cloud_sogou = 5
"
"" 每打多少个词后存盘
"let g:vimim_chinese_frequency = 20
"
"" vimim end
"256配色"
set t_Co=256
