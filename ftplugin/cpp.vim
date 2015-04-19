"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Touches de fonction F5....F10                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F5
" Compile
nnoremap <F5> :make<cr>
set makeprg=make\ -C\ /home/code/git/dbtx-code/build\ -j2

" F6
" lance le prog
nnoremap <F6> :!/home/code/git/sekhmet/bin/Debug/sekhmet_0.1.1d.bin --gui<cr>

" F7
" switch header cpp
nnoremap <F7> :A<cr>

" F8
" affiche/enleve le menu des classes
nnoremap <silent> <F8> :TlistToggle<CR>
"nnoremap <silent> <F8> :TagbarToggle<CR>

" F9
" affiche/enleve les parentese couleur
nnoremap <silent> <F9> :RainbowToggle<CR>


