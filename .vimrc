" ==========================================================================
" File:          .vimrc
" Maintainer:    Tamas Dezso <dezso.t.tamas@gmail.com>
" Last Changed:  May 31, 2017
" ==========================================================================

set nocompatible  " enable Vim specific settings (instead of vi compatible mode)
"set nowritebackup " do not write backup
"set noswapfile    " do not use swap file
set ff=unix       " use unix file format

" Use clipboard as the unnamed '+' register, so Yank-Put cross-works between
" different Vim instances and other programs too
"
" This requires +clipboard feature which is not obvious to have, check it by
" `vim --version`. In case of -clipboard another version of Vim might worth
" considering e.g., vim-gnome, vim-athena, vim-gtx
" MacOS: brew install macvim --with-override-system-vim
"     OR brew install vim --with-client-server
"
" Since the clipboard belongs to the windowing system, in case of remote
" sessions it requires X11 forwarding even for pure terminal use (ssh -Y)
" MacOS: MacVim is able to access the clipboard natively w/o X server running
" but for other cases XQuartz should have all Pasteboard options to be
" enabled under its Preferences
if has('clipboard')
  set clipboard=unnamed,unnamedplus,autoselect

  " If X11 forwarding is active and the connection is slow, the process of Vim
  " connecting to the clipboard becomes slow too, resulting delayed startup.
  " Excluding the clipboard will solve this, but obviously the assignment of
  " the unnamedplus register to it will brake.
  "set clipboard=exclude:.* " not to try connecting to the X server's clipboard
endif

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" if autocommands are supported
if has("autocmd")
  " enable file type detection, use the default filetype settings,
  " so that mail gets 'tw' set to 72, 'cindent' is on in C files, etc.
  " also load indent files to automatically do language-dependent indenting
  filetype plugin indent on

  " for all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " function for restoring cursor position
  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction
  " restore cursor position
  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END

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
set nojoinspaces   " use only one space instead of two if joining lines
set encoding=utf-8 " set UTF-8 file encoding
set backspace=indent,eol,start " backspace to go over everything in insert mode
set softtabstop=0  " turn mixing of tabs and spaces off
set tabstop=4      " set tab length in spaces (manual indent)
set shiftwidth=4   " set the number of spaces inserted for a tab (autoindent)
set expandtab      " convert tabs to spaces
"set smarttab       " not sure...
"set paste          " paste from other application w/o indenting
set pastetoggle=<F2> " set F2 to toggle paste mode

" visualize tabs and trails (turns off/on with <Shift-Tab> in command mode)
set list listchars=tab:»\ ,trail:·
nnoremap <S-Tab> :set list!<CR>

" keep 2 lines above and below the cursor visible when scrolling
set scrolloff=2

" use indentation based folding (\ in command mode opens/closes fold)
set foldmethod=indent foldlevel=99
nnoremap \ za

" enable mouse in terminal emulators if in insert mode
if has('mouse')
  " Set mouse to work in all modes, resulting easy positioning by clicking and
  " easy Visual mode selection. However, by easy Visual mode selection, default
  " terminal mouse behavior is lost. Default terminal mode mouse behavior can be
  " achieved by pressing <Shift> during clicking (selection).
  " Copy-Paste also works for the selection with Ctrl+Shift+C - Ctrl+Shit+V.
  " MacOS: To temporarily bypass Mouse Reporting and interact with the terminal
  " view, press the <Fn> modifier key while clicking or scrolling. There is also
  " a View > Allow Mouse Reporting (⌘R) menu item you can use to bypass Mouse
  " Reporting for longer periods of time, or if the modifier key isn't
  " available.
  set mouse=a
  set mousehide " hide mouse while typing
  set mousemodel=popup " right mouse button pops up a menu, like in Windows
endif

" add command :UU to convert to unix file format (and save it)
command UU w ++ff=unix

" persistent undo
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p")
endif
set undodir=$HOME/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Run Vim plugin autoloader: ~/.vim/autoload/pathogen.vim
" See:     https://github.com/tpope/vim-pathogen
" Install: mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"          curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" Plugin packages go to ~/.vim/bundle
" Standalone .vim plugins go to ~/.vim/plugin
silent! execute pathogen#infect()

" vim-markdown is an enhanced syntax highlighting plugin, install (pathogen):
" git clone https://github.com/plasticboy/vim-markdown ~/.vim/bundle/vim-markdown
" Its folding feature on big files makes Vim slow, that's why it is disabled:
let g:vim_markdown_folding_disabled=1

" vim-airline is a fancy status line plugin, install (pathogen):
" git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
" To make the status line visible, laststatus needs to be set:
silent! set laststatus=2

" NERDTree is a directory tree plugin, install (pathogen):
" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
" map Ctrl-N to toggle NERDTree
silent! nnoremap <C-n> :NERDTreeToggle<CR>
" map Tab to change window
silent! nnoremap <Tab> <C-w><C-w>

" use molokai color scheme if available, that can be installed with:
" git clone https://github.com/tomasr/molokai ~/.vim/bundle/molokai
silent! colorscheme molokai

