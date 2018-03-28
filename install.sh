#!/bin/bash
# ==========================================================================
# @file    install.sh
# @brief   shell script to install bash profile, Vim config and plugins
# @author  Tamas Dezso <dezso.t.tamas@gmail.com>
# @date    March 28, 2018
# ==========================================================================

if [ $# -eq 0 ]
then
    # copy bash and Vim profile, git config
    cp -i .bash* .vimrc .gvimrc .gitignore .gitconfig $HOME/
else
    # copy files given as arguments
    cp -i $@ $HOME/
fi

# set Vim configuration location and plugins to be installed
VIM=$HOME/.vim
PLUGINS=(
    "https://github.com/tomasr/molokai"                   # Dark color scheme
    "https://github.com/octol/vim-cpp-enhanced-highlight" # C++ highlight
    "https://github.com/plasticboy/vim-markdown"          # Markdown highlight
    "https://github.com/bling/vim-airline"                # Fancy status line
    "https://github.com/tpope/vim-commentary"             # Comment stuff out
    "https://github.com/mbbill/undotree"                  # Undotree visualizer
    "https://github.com/majutsushi/tagbar"                # Tagbar
    "https://github.com/ctrlpvim/ctrlp.vim"               # Ctrlp
    "https://github.com/tpope/vim-fugitive"               # Fugitive
    "https://github.com/scrooloose/nerdtree"              # NERD Tree
    "https://github.com/xolox/vim-misc"                   # needed for vim-session
    "https://github.com/xolox/vim-session"                # Extended sessions
    "https://github.com/chrisbra/vim-diff-enhanced"       # :EnhancedDiff <algorithm>
)

# install plugin autoloader pathogen (if not yet present)
# see: https://github.com/tpope/vim-pathogen
# remember to put `pathogen#infect()` to .vimrc to have plugins autoloaded
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
