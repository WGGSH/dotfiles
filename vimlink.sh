#!/bin/sh

unlink ~/.config/nvim/init.vim
unlink ~/.config/nvim/ginit.vim
unlink ~/.config/nvim/dein.toml
unlink ~/.config/nvim/dein_lazy.toml
unlink ~/.config/nvim/oni/config.vim
unlink ~/.config/nvim/coc-settings.json
unlink ~/.config/oni/config.tsx

ln -s `pwd`/init.vim ~/.config/nvim/
ln -s `pwd`/ginit.vim ~/.config/nvim/
ln -s `pwd`/dein.toml ~/.config/nvim/
ln -s `pwd`/dein_lazy.toml ~/.config/nvim/
ln -s `pwd`/oni/config.vim ~/.config/nvim/oni/
ln -s `pwd`/coc-settings.json ~/.config/nvim/
ln -s `pwd`/oni/config.tsx ~/.config/oni/
