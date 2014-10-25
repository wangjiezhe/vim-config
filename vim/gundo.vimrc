"""""""""" Gundo Configuration """"""""""""""""""""""""""""""""""""""""""""""""""

"let g:gundo_disable = 1
nnoremap <F7> :GundoToggle<CR>

func! MakeTempDir()
	let tmp_dir = finddir("vim_undodir", "/tmp")
	if strlen(tmp_dir) == 0
		call mkdir("/tmp/vim_undodir", "p")
	endif
endfunc

try
	call MakeTempDir()
	set undodir=/tmp/vim_undodir
	set undofile
catch
endtry
