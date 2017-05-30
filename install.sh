#!/bin/bash
# ==========================================================================
# @file    install.sh
# @brief   shell script to install bash profile, Vim config and plugins
# @author  Tamas Dezso <dezso.t.tamas@gmail.com>
# @date    May 12, 2017
# ==========================================================================

# copy bash profile
cp -i .bash* ~/

# copy .vimrc and .gvimrc
cp -i .vimrc .gvimrc ~/

# set Vim configuration location and plugins to be installed
VIM=$HOME/.vim
PLUGINS=(
    "https://github.com/scrooloose/nerdtree"              # file tree explorer
    "https://github.com/tomasr/molokai"                   # dark color scheme
    "https://github.com/octol/vim-cpp-enhanced-highlight" # C++ highlight
    "https://github.com/plasticboy/vim-markdown"          # Markdown highlight
)

# install plugin autoloader pathogen (if not yet present)
# see: https://github.com/tpope/vim-pathogen
# remember to put `pathogen#infect()` to .vimrc to have plugins autoloaded
if [ ! -f $VIM/autoload/pathogen.vim ]
then
    # check if curl is available
    command -v curl >/dev/null || { echo "Missing curl. Aborting."; exit 1; }
    # create dirs, download
    mkdir -p $VIM/autoload $VIM/bundle && \
    curl -LSso $VIM/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# install plugins by cloning them from GitHub (if not yet done and wanted to)
for PLUGIN in "${PLUGINS[@]}"; do
    DESTDIR=$VIM/bundle/${PLUGIN##*\/}
    if [ ! -d "$DESTDIR" ]
    then
        echo -n "Install Vim plugin: $PLUGIN? (y/N) "; read is_install
        [[ "${is_install:0:1}" =~ [yY] ]] && \
        git clone $PLUGIN $DESTDIR
    fi
done
