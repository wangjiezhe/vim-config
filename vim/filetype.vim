augroup filetypedetect

au BufNewFile,BufRead *.md    setf markdown
au BufNewFile,BufRead *.sage  setf python

augroup END
