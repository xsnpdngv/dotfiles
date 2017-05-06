#!/bin/sh
# ==========================================================================
# @file    vinstall.sh
# @brief   shell script to install profile, .vimrc and vim plugins
# @author  Tamas Dezso <dezso.t.tamas@gmail.com>
# @date    May 6, 2017
# ==========================================================================

# copy profile (.bashrc, .profile)
cp -i .bashrc .profile ~/

# copy .vimrc and .gvimrc
cp -i .vimrc .gvimrc ~/

# install plugin autoloader: pathogen
# see: https://github.com/tpope/vim-pathogen
# remember to put `pathogen#infect()` to .vimrc to have plugins autoloaded
if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
    # check if curl is available
    command -v curl >/dev/null || { echo "Missing curl. Aborting."; exit 1; }
    # create dirs, download
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# install NERDTree plugin
[ -d ~/.vim/bundle/nerdtree ] || \
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# install Molokai color scheme
[ -d ~/.vim/bundle/molokai ] || \
git clone https://github.com/tomasr/molokai ~/.vim/bundle/molokai
