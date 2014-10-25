if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
" than 50 lines of registers
"set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
	augroup fedora
		autocmd!
		" In text files, always limit the width of text to 78 characters
		" autocmd BufRead *.txt set tw=78
		" When editing a file, always jump to the last cursor position
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line ("'\"") <= line("$") |
					\   exe "normal! g'\"" |
					\ endif
		" don't write swapfile on most commonly used directories for NFS mounts or USB sticks
		autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
		" start with spec file template
		autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
	augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add $PWD/cscope.out
		cs add $PWD/include/cscope.out
		cs add "$PWD/../cscope.out"
		cs add "$PWD/../include/cscope.out"
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

if &term=="xterm"
	set t_Co=8
	set t_Sb=[4%dm
	set t_Sf=[3%dm
endif

let mapleader = ","

if filereadable(expand("~/.vim/neobundle.vimrc"))
	source ~/.vim/neobundle.vimrc
endif

source ~/.vim/easymotion.vimrc
source ~/.vim/gundo.vimrc
source ~/.vim/latex.vimrc
source ~/.vim/nerdtree.vimrc
source ~/.vim/syntastic.vimrc
source ~/.vim/tagbar.vimrc
source ~/.vim/ycm.vimrc
source ~/.vim/neocomplete.vimrc

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
"let &guicursor = &guicursor . ",a:blinkon0"

set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
"winpos 5 5          " 设定窗口位置
set lines=108 columns=192    " 设定窗口大小
syntax enable
syntax on	" 语法高亮
" set guifont=DejaVuSansMono\ Bold\ 11   " 设置字体
set guifont=SourceCodePro\ Semibold\ 12
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set showcmd		" 输入的命令显示出来，看的清楚些
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set novisualbell    " 不要闪烁
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠
set background=dark "背景使用黑色

"设置配色方案
colorscheme molokai
" if has('gui_running')
" 	colorscheme evening
" else
" 	colorscheme desert
" endif

" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gbk
set fileencoding=utf-8


set autoindent	" 自动缩进

if &filetype == 'c'
	set cindent		" 按照c语言的习惯自动缩进
	set smartindent	" 为C程序提供自动缩进
endif

set shiftwidth=4
set softtabstop=4

" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab

set nu		" 显示行号
set tabstop=4	" Tab键的宽度为4
set showmatch

" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
"set noswapfile
"搜索忽略大小写
"set ignorecase
"仅在全是小写时忽略大小写
set smartcase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault


" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=preview,menu
"允许插件
filetype plugin on
"共享剪贴板
set clipboard+=unnamed
"从不备份
"set nobackup
"make 运行
set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite

set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
"set iskeyword+=33-47,58-64,91-96,123-128
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 插入模式下，“←”如何删除光标前的字符：行首空白、换行符、插入点之前的字符
" set backspace=indent,eol,start
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 去掉输入错误的提示声音
" set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm

set gcr=a:block-blinkwait700-blinkon400-blinkoff400		" 块状光标

"自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction
filetype plugin  indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set foldmethod=indent
autocmd FileType python set foldlevel=99
autocmd FileType python set expandtab

"set tags=/usr/share/vim/vim73/tags

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" let g:winManagerWindowLayout='FileExplorer|TagList'
" nmap wm :WMToggle<cr>

let g:Powerline_symbols = 'fancy'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:lt_location_list_toggle_map = '<leader><leader>l'
let g:lt_quickfix_list_toggle_map = '<leader><leader>q'

map <leader>v <Plug>TaskList

nnoremap <silent> <leader><leader>t :CommandT<CR>
nnoremap <silent> <leader><leader>b :CommandTBuffer<CR>

"""""""""" Ultisnips """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<C-Tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-B>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


""""""""""" Youdao-translater """"""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> <C-L> <Esc>:Ydv<CR>
nnoremap <silent> <C-L> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>


""""""""""" gitgutter 配置 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 1000


"""""""""""Markdown配置"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1
"let g:vim_markdown_initial_foldlevel=1

autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!chromium %:p<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap <leader>q :wq<cr>
" nmap <leader>f :find<cr>

" 交换;和:
" nnoremap ; :
" nnoremap : ;

" 使用左右键切换buffer
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
"map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行
"nnoremap <F2> :g/^\s*$/d<CR>
"比较文件
"nnoremap <C-F2> :vert diffsplit
"新建标签
"map <M-F2> :ta bnew<CR>
"列出当前目录文件
"map <F3> :tabnew .<CR>
"打开树状文件目录
"map <C-F3> \be
"C,C++ 按F5调用gcc编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -lm -Wall % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
		exec "!chmod +x %"
		exec "! ./%"
	elseif &filetype == 'python'
		exec "!chmod +x %"
		exec "! ./%"
	elseif &filetype == 'markdown'
		exec "!chromium '%'"
    endif
endfunc
"C,C++ 按F6调用clang编译运行
map <F6> :call CompileRunClang()<CR>
func! CompileRunClang()
	exec "w"
	if &filetype == 'c'
		exec "!clang -lm % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!clang++ % -o %<"
		exec "! ./%<"
	endif
endfunc
"C,C++ 按F8调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    if &filetype == 'c'
        exec "w"
        exec "!gcc -lm -Wall % -g -o %<"
        exec "!gdb ./%<"
    if &filetype == 'cpp'
        exec "w"
        exec "!g++ % -g -o %<"
        exec "!gdb ./%<"
endfunc
"F12切换paste模式
:set pastetoggle=<F12>


""""""" CTags的设定 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;/
set autochdir

