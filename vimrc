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


set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'scrooloose/nerdtree'
"Bundle 'wangjiezhe/vim-plugins'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'plasticboy/vim-markdown'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'TagHighlight'
Bundle 'LargeFile'
" Bundle 'readnovel'
" git repos on your local machine (i.e. when working on your own plugin)
Bundle 'file:///home/wangjiezhe/.vim/bundle/vim-plugins'


" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
"let &guicursor = &guicursor . ",a:blinkon0"

"启用pathogen，加在 filetype plugin indent on 之前的任何地方
"call pathogen#infect()

set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
"winpos 5 5          " 设定窗口位置  
set lines=40 columns=155    " 设定窗口大小  
syntax enable
syntax on	" 语法高亮
set guifont=DejaVuSansMono\ Bold\ 12   " 设置字体 
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
if has('gui_running')
	colorscheme evening
else
	colorscheme desert
endif

" 显示中文帮助
if version >= 603
    set helplang=cn
	set encoding=utf-8
endif

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk
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
"set nobackup
"set noswapfile
"搜索忽略大小写
set ignorecase
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
:set makeprg=g++\ -Wall\ \ %
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
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
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
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin  indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu


"set tags=/usr/share/vim/vim73/tags

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

let g:Powerline_symbols = 'fancy'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:ycm_confirm_extra_conf = 0
"let g:ycm_extra_conf_vim_data = ['v:704']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1

" set statusline+=%#warningsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=1
" let g:syntastic_aggregate_errors=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=5
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_echo_current_error=1
" let g:syntastic_enable_signs=1
" let g:syntastic_enable_highlighting=1
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'active_filetypes': ['c'],
"                            \ 'passive_filetypes': [] }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""Markdown配置"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1
"let g:vim_markdown_initial_foldlevel=1

autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!chromium-browser %:p<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""LaTeX配置""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
"func SetTitle() 
"    "如果文件类型为.sh文件 
"    if &filetype == 'sh' 
"        call setline(1,"\#########################################################################") 
"        call append(line("."), "\# File Name: ".expand("%")) 
"        call append(line(".")+1, "\# Author: wangjiezhe") 
"        call append(line(".")+2, "\# mail: wangjiezhe@gmail.com") 
"        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
"        call append(line(".")+4, "\#########################################################################") 
"        call append(line(".")+5, "\#!/bin/bash") 
"        call append(line(".")+6, "") 
"    else 
"        call setline(1, "/*************************************************************************") 
"        call append(line("."), "    > File Name: ".expand("%")) 
"        call append(line(".")+1, "    > Author: wangjiezhe") 
"       call append(line(".")+2, "    > Mail: wangjiezhe@gmail.com ") 
"       call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
"        call append(line(".")+4, " ************************************************************************/") 
"        call append(line(".")+5, "")
"    endif
"    if &filetype == 'cpp'
"        call append(line(".")+6, "#include<iostream>")
"        call append(line(".")+7, "using namespace std;")
"        call append(line(".")+8, "")
"    endif
"    if &filetype == 'c'
"        call append(line(".")+6, "#include<stdio.h>")
"        call append(line(".")+7, "")
"    endif
"    "新建文件后，自动定位到文件末尾
"    autocmd BufNewFile * normal G
"endfunc 





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
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
    elseif &fil etype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
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
"F9切换paste模式
:set pastetoggle=<F9>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
"autocmd vimenter * if !argc() | NERDTree | endif
"open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :TagbarToggle<CR>   "设置快捷键
let g:tagbar_width = 25       "设置宽度，默认为40
autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开tagbar
"let g:tagbar_left = 1         "在左侧
let g:tagbar_right = 1        "在右侧







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Sort_Type = "name"    " 按照名称排序  
"let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
"let Tlist_Compart_Format = 1    " 压缩方式  
"let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags  
set autochdir 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"默认打开Taglist 
"let Tlist_Auto_Open=1 
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
"let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
"let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
"let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1   

