"""""""""" NeoBundle Configuration """"""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
	set nocompatible               " Be iMproved
	"  Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" scripts on GitHub repos
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
"NeoBundle 'wangjiezhe/vim-plugins'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Valloric/ListToggle'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
" Bundle 'godlygeek/csapprox'
NeoBundle 'klen/python-mode'		" Bug!
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Raimondi/delimitMate'
"Bundle 'hdima/python-syntax'
NeoBundle 'yonchu/accelerated-smooth-scroll'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'ianva/vim-youdao-translater'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'wincent/command-t'
NeoBundle 'Shougo/vimproc', {'build': {'unix': 'make'}}
NeoBundle 'Shougo/vimshell'
"NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'wlangstroth/vim-racket'
"NeoBundle 'kovisoft/slimv'
NeoBundle 'jalcine/cmake.vim'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'yianwillis/vimcdoc'
" scripts from http://vim-scripts.org/vim/scripts.html
NeoBundle 'TaskList.vim'
NeoBundle 'TagHighlight'
NeoBundle 'LargeFile'
NeoBundle 'readnovel'
NeoBundle 'LaTeX-Suite-aka-Vim-LaTeX'
NeoBundle 'vimlatex'
NeoBundle 'latexmenu'
NeoBundle 'LaTeX-Help'
NeoBundle 'scribble.vim'
"NeoBundle 'racket-auto-keywords.vim'
"NeoBundle 'auctex.vim'
NeoBundle 'aux2tags.vim'
" git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///home/wangjiezhe/.vim/bundle/vim-plugins'

"NeoBundle 'Valloric/YouCompleteMe', {'build': {'unix': 'git submodule update --init --recursive; bash install.sh --clang-completer --system-libclang --omnisharp-completer'}}

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
