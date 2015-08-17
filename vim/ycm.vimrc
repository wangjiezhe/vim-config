"""""""""" YouCompleteMe Configuration """"""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=1

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"let g:ycm_filetype_whitelist = {
"	\ 'c': 1,
"	\ 'cpp': 1
"	\}

"let g:ycm_filetype_blacklist = {
"	\ '*' : 1
"	\}
