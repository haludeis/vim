" File ~/.vim/ftplugin/htmldjango.vim
" Django specific settings.

    if has("gui_running")
        " Dossier du fichier comme dossier de travail de gVim
        set acd

        " Menu spécial c++
        amenu 237.7 C++.Xterm <ESC>:!xterm &<CR><CR>
        amenu 237.8 C++.Krusader <ESC>:!krusader &<CR><CR>
        amenu 237.9 C++.PDF <ESC>:w<CR>:!pdflatex %<.tex<CR><CR>
        amenu 237.10 C++.Demi\ PDF <ESC>:!pdfnup --outfile %<-miformat.pdf %<.pdf<CR>
        amenu 237.20 C++.Sens\ Dessus-dessous <ESC>:!/home/moi/.scripts/sensdessudessous.sh %<.pdf<CR>
        amenu 237.30 C++.Double-demi <ESC>:!pdfnup --suffix 'dd' %<.pdf %<.pdf<CR>
        amenu 237.40 C++.Quart\ PDF <ESC>:!pdfnup --nup 4 --outfile %<-quarto.pdf %<.pdf<CR>
        amenu 237.90 C++.Nettoyage <ESC>:!rm -f %<.aux %<.dvi %<.log %<.out %<.ps %<.toc %<-miformat.ps <CR>
        amenu 237.100.10 C++.Make.pdf <ESC>:!make pdf <CR>
        amenu 237.100.20 C++.Make.maj <ESC>:!make maj <CR>
    endif

    "set dict+=~/.vim/dico/c++
    "set dict+=~/.vim/dico/qt
    "UltiSnipsAddFileTypes cpp
    "UltiSnipsAddFiletypes qt

