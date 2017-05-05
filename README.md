# Personal settings

Basic configuration files for convenient terminal usage.

## .vimrc

### Features  

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

etc.

## .gvimrc

### Features

- GUI font and color scheme setting
- Window sizing and positioning
- Toolbar, Menubar, Scrollbar removal


## Install

In order to place `.vimrc` and `.gvimrc` and install plugin
handling and used plugins, execute `vinstall.sh`. The script
does not care about the shell profile files.

```bash
vinstall.sh
```
