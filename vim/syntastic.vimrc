"""""""""" Syntastic Configuration """"""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=10
" let g:syntastic_always_populate_loc_list=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_highlighting=1
" let g:syntastic_always_populate_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
			\ 'active_filetypes': ['c', 'python', 'markdown'],
			\ 'passive_filetypes': [] }
" let g:syntastic_python_python_exe = 'python3'
let g:syntastic_enable_balloons = 1
" Interaction with python-mode
" let g:pymode_lint_write = 0

let g:syntastic_python2_python_exe = 'python2'
let g:syntastic_python3_python_exe = 'python3'
let g:syntastic_python_default_version = 'python'
"let g:syntastic_python2_checkers
function! Parse_Python_Shebang()
	let line = getline(1)
	if line =~# '\m^#!\s*[^ \t]*\<python2\=\>'
		let g:syntastic_python_python_exec = g:syntastic_python2_python_exe
		" let g:syntastic_python_checkers = g:syntastic_python2_checkers
	elseif line =~# '\m^#!\s*[^ \t]*\<env\>\s*\<python2>'
		let g:syntastic_python_python_exec = g:syntastic_python2_python_exe
		" let g:syntastic_python_checkers = g:syntastic_python2_checkers
	elseif line =~# '\m^#!\s*[^ \t]*\<python3\>'
		let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
		" let g:syntastic_python_checkers = g:syntastic_python3_checkers
	elseif line =~# '\m^#!\s*[^ \t]*\<env\>\s*\<python3\>'
		let g:syntastic_python_python_exec = g:syntastic_python3_python_exe
		" let g:syntastic_python_checkers = g:syntastic_python3_checkers
	else
		let g:syntastic_python_python_exec = g:syntastic_python_default_version
		" let g:syntastic_python_checkers = g:syntastic_python_default_version =~# '\<python3$' ? g:syntastic_python3_checkers : g:syntastic_python2_checkers
	endif
endfunction

command! SyntasticPython2 let g:syntastic_python_python_exec = g:syntastic_python2_python_exe |
"    \ let g:syntastic_python_checkers = g:syntastic_python2_checkers
command! SyntasticPython3 let g:syntastic_python_python_exec = g:syntastic_python3_python_exe |
"    \ let g:syntastic_python_checkers = g:syntastic_python3_checkers

autocmd BufWinEnter *.py call Parse_Python_Shebang()

