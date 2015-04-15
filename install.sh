#!/bin/sh
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/fswap
git clone https://github.com/gmarik/Vundle.vim.git  ~/.vim/bundle/Vundle.vim
cp ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall

