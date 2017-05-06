# Personal settings

Basic configuration files for convenient terminal and Vim usage

## .bashrc

Default `.bashrc` file with some additions:

- Fancy color prompt with Git branch indication in it
- `PATH` to have `.`, `~/bin` and `~/.local/bin`
- Environment variables `INCLUDE` and `LIB` set to `~/include` and `~/lib`
  accordingly
- `LIB` to complete `LD_LIBRARY_PATH`, so shared libraries here will be found
- Vim to set as default visual editor
- Set locale to `en_US.UTF-8`

## .profile

Includes `.bashrc` to have everything in one place for either terminal or X11
use.


## .vimrc

- Improved search
- Syntax highlighting
- Filetype based automatic indentation
- Unix file type default
- No swap file usage
- UTF-8 encoding
- Text width defintion
- Overlength indication
- Usage of 4 spaces as tabs
- One key paste toggling
- Switchable indication for trailing tabs and spaces
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

In order to copy `.bashrc`, `.profile`, `.vimrc` and `.gvimrc`
to their destinations and install Vim plugin handling and used plugins, execute
`install.sh`. The script does not overwrite anything without asking so.

```bash
./install.sh
```
