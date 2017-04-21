" ==========================================================================
" File:          .vimrc
" Maintainer:    Tamas Dezso <dezso.t.tamas@gmail.com>
" Last Changed:  March 21, 2017
" Version:       1.0
" ==========================================================================

" enable Vim specific settings (instead of vi compatible mode)
set nocompatible

" if X11 forwarding is active, then starting Vim would take long without it
"set clipboard=exclude:.* " not to try connecting to the X server's clipboard

" if autocommands are supported
if has("autocmd")
  " enable file type detection, use the default filetype settings,
  " so that mail gets 'tw' set to 72, 'cindent' is on in C files, etc.
  " also load indent files to automatically do language-dependent indenting
  filetype plugin indent on

  " for all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
else
  set autoindent
endif

" when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on        " syntax highlight
  set hlsearch     " search pattern highlight
  set incsearch    " dynamic search pattern highlight
  " overlength highlight (> 80)
  highlight OverLength ctermbg=white ctermfg=red
  match OverLength /\%81v.\+/
endif

set history=100    " keep 100 lines of command line history
set ruler          " show cursor position all the time
set showcmd        " display incomplete commands
set showmode       " display mode
"set paste          " paste from other application w/o indenting
set nojoinspaces   " use one space instead of two if joining lines
set encoding=utf-8 " set UTF-8 file encoding
set backspace=indent,eol,start " backspace to go over everything in insert mode
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " 4 space tab
set pastetoggle=<F2> " set F2 to toggle paste mode
set cm=blowfish2   " enable strong crypt method for command :X

" visualize tabs and trails (tab in command mode turns off/on)
set list listchars=tab:»\ ,trail:·
nnoremap <Tab> :set list!<CR>

" use indentation based folding (\ in command mode opens/closes fold)
set foldmethod=indent foldlevel=99
nnoremap \ za

" enable mouse in terminal emulators if in insert mode
if has('mouse')
  set mouse=i
  " NOTE: i keeps terminal mode selection working in normal and visual modes
endif

" add command :UU to convert to unix format
command UU w ++ff=unix
