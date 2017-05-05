#!/bin/sh
# ==========================================================================
# @file    vinstall.sh
# @brief   shell script to install .vimrc and related plugins
# @author  Tamas Dezso <dezso.t.tamas@gmail.com>
# @date    May 5, 2017
# ==========================================================================

# check if curl and git are available
command -v curl >/dev/null || { echo "Missing curl. Aborting."; exit 1; }
command -v git >/dev/null  || { echo "Missing git. Aborting."; exit 1; }

# copy .vimrc and .gvimrc to their place
cp -i .vimrc .gvimrc ~/

# install plugin autoloader pathogen
# see: https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# this requires `pathogen#infect()` in .vimrc to work

# install NERDTree plugin
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# install Molokai color scheme
git clone https://github.com/tomasr/molokai ~/.vim/bundle/molokai
