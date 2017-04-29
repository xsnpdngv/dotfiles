" ==========================================================================
" File:          .vimrc
" Maintainer:    Tamas Dezso <dezso.t.tamas@gmail.com>
" Last Changed:  April 29, 2017
" ==========================================================================

set nocompatible  " enable Vim specific settings (instead of vi compatible mode)
set nowritebackup " do not write backup
set noswapfile    " do not use swap file
set ff=unix       " use unix file format

" if X11 forwarding is active, then starting Vim might take long without it
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
  " mark first overlength character (@81)
  highlight OverLength ctermfg=white ctermbg=darkgrey
  match OverLength /\%81v./
endif

set history=500    " keep 100 lines of command line history
set ruler          " show cursor position all the time
set showcmd        " show incomplete commands
set showmode       " show mode
set nojoinspaces   " usea only one space instead of two if joining lines
set encoding=utf-8 " set UTF-8 file encoding
set backspace=indent,eol,start " backspace to go over everything in insert mode
set softtabstop=0  " turn mixing of tabs and spaces off
set tabstop=4      " set tab length in spaces (manual indent)
set shiftwidth=4   " set the number of spaces inserted for a tab (autoindent)
set expandtab      " convert tabs to spaces
"set smarttab       " not sure...
"set paste          " paste from other application w/o indenting
set pastetoggle=<F2> " set F2 to toggle paste mode

" visualize tabs and trails (turns off/on with <tab> in command mode)
set list listchars=tab:»\ ,trail:·
nnoremap <Tab> :set list!<CR>

" use indentation based folding (\ in command mode opens/closes fold)
set foldmethod=indent foldlevel=99
nnoremap \ za

" enable mouse in terminal emulators if in insert mode
if has('mouse')
  set mouse=a
  " Set mouse to work in all modes, resulting easy positioning by clicking and
  " easy Visual mode selection. However, by easy Visual mode selection, default
  " terminal mouse behavior is lost. Default terminal mode mouse behavior can be
  " achieved by pressing <Shift> while both selecting and clicking.
  " Copy-Paste also works for the selection with Ctrl+Shift+C-Ctrl+Shit+V.
  set mousehide " hide mouse while typing
  set mousemodel=popup " right mouse button pops up a menu, like in Windows
endif

" add command :UU to convert to unix file format
command UU w ++ff=unix
