# Personal settings

Basic configuration files for convenient terminal and Vim usage.
Beyond the following feauture listings, each file has extensive comments
on settings.

## .bashrc

Default `.bashrc` file with some additions:

- Fancy color prompt with Git branch indication in it
- Vim as default visual editor
- Vi editing mode for the command line
- `PATH` includes `.`, `~/bin` and `~/.local/bin`
- `INCLUDE` and `LIB` environment variables set to `~/include` and `~/lib`
  accordingly
- `LIB` to complete `LD_LIBRARY_PATH`, so shared libraries here will be found
- Set locale to `en_US.UTF-8`

## .bash_profile

Includes `.bashrc` to have everything in one place for either terminal or X11
use.


## .vimrc

- Improved search
- Syntax highlighting
- Filetype based automatic indentation
- Unix file type as default
- No swap file usage
- UTF-8 encoding
- Text width defintion
- Overlength indication
- Usage of 4 spaces as tabs
- One key paste-toggling
- Cursor position restoration
- Switchable indication for tabs and trailing spaces
- Clipboard usage as default register
- Mouse enablement even in terminal
- Plugin handling (Pathogen)
- Color scheme setting (Molokai plugin)

### Mappings

`F2` - paste toggle  
`/` - open/close fold (`za`)  
`Tab` - change window (`C-w-w`)  
`Shift-Tab` - Toggle trailing whitespace indication  
`Ctrl-N` - Toggle directory tree (`:NERDTreeToggle` - NERDTree plugin)

## .gvimrc

- GUI font and color scheme setting
- Window sizing and positioning
- Toolbar, Menubar, Scrollbar removal


## Install

In order to copy bash profile files (`.bashrc`, `.bash_profile`,
`.bash_aliases`) and Vim configurations (`.vimrc`, `.gvimrc`) to their
standard locations (`~/`) and install Vim plugin handler (`pathogen`) and used
plugins (`NERDTree`, `Molokai`) under `~/.vim/`, execute `install.sh`. The
script does not overwrite anything without asking so.

```bash
./install.sh
```
