# Personal profile settings

Continuously changing configuration files for convenient terminal and Vim
usage. Beyond the following feauture listings, each file has extensive comments
on settings.

## .bashrc

Default `.bashrc` file with additions to set:

- Fancy color prompt with Git branch indication
- Vim as default visual editor
- Vi editing mode for the command line
- `$PATH` to include `.`, `~/bin` and `~/.local/bin`
- `$INCLUDE` and `$LIB` to `~/include` and `~/lib` accordingly
- `LIB` to complete `LD_LIBRARY_PATH`, so shared libraries here will be found
- Locale to `en_US.UTF-8`

## .bash_profile

Includes `.bashrc` to have everything in one place for either terminal or X11
use.

## .vimrc

- Improved search
- Filetype based
    - syntax highlighting
    - automatic indentation
- Unix file format
- UTF-8 encoding
- Persistent undo
- Text width preset
- Overlength indication
- 4 spaces for tabs
- One key paste-toggling
- Cursor position restoration
- Indication for tabs and trailing spaces
- X11 clipboard for copy-pasting
- Mouse enablement even in terminal
- Plugin autoloading (Pathogen)
- Colorscheme setting (Molokai)
- Non-ASCII character highlighting & removal

### Mappings

`F2` - toggle paste  
`F8` - toggle tagbar  
`/` - open/close fold (`za`)  
`Tab` - change window (`C-w-w`)  
`Shift-Tab` - change window backwards (`C-w-Left`)  
`Ctrl-L` - format actual paragraph (`gqip`)  
`Ctrl-U` - toggle undo tree (`:UndotreeToggle`)  
`-u` - clear undo history (`:call ClearUndo()`)  
`ct` - generate ctags  
`Ctrl-]` - go declaration/definition  
`Ctrl-t` - go back  
`gb` - list buffers to select  
`gd` - list buffers to close  
`C-p` - list files / buffers / most recent files to easy open (`C-<up>`, `C-<down>` to change)  
`Alt+2` - opens file explorer (`:Explore`)  
`Alt+3` - opens file explorer in new tab (`:Texplore`)  
`Alt+1` - returns to previous file explorer (`:Rexplore`)  
`,,` - turns off highlighting for searched pattern (`:noh`)  
`Ctrl+P` - file list explorer of CtrlP plugin  
`Ctrl+B` - buffer list explorer of CtrlP plugin  

## .gvimrc

- GUI font and color scheme setting
- Window sizing and positioning
- Toolbar, Menubar, Scrollbar removal


## install.sh

```bash
./install.sh
```

- Profile install to `$HOME` with prompt for overwrite:
    - .bashrc
    - .bash_profile
    - .bash_aliases
    - .vimrc
    - .gvimrc
- Vim plugin autoloader download to `$HOME/.vim/autoload/`:
    - [Pathogen](https://tpo.pe/pathogen.vim)
- Vim plugin cloning from GitHub to `$HOME/.vim/bundle/`:
    - [Molokai Color Scheme](https://github.com/tomasr/molokai)
    - [C++ Enhanced Syntax Highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
    - [Markdown Syntax Highlight](https://github.com/plasticboy/vim-markdown)
    - [Vim-airline](https://github.com/bling/vim-airline)
    - [Vim-commentary](https://github.com/tpope/vim-commentary)
    - [Undotree](https://github.com/mbbill/undotree)
    - [Tagbar](https://github.com/majutsushi/tagbar")
    - [Ctrlp](https://github.com/ctrlpvim/ctrlp.vim")
    - [Fugitive](https://github.com/tpope/vim-fugitive.git)
    - [Startify](https://github.com/mhinz/vim-startify")
