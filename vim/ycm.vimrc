"""""""""" YouCompleteMe Configuration """"""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1

let g:ycm_filetype_whitelist = {
	\ 'c': 1,
	\ 'cpp': 1
	\}
