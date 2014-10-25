"""""""""" Tagbar Configuration """"""""""""""""""""""""""""""""""""""""""""""""""

nmap <F4> :TagbarToggle<CR>   "设置快捷键
let g:tagbar_width = 25       "设置宽度，默认为40
autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开tagbar
"let g:tagbar_left = 1         "在左侧
let g:tagbar_right = 1        "在右侧
