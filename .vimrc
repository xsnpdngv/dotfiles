" ============================================================================
" File:          .vimrc
" Maintainer:    Tamas Dezso <dezso.t.tamas@gmail.com>
" Last Changed:  October 13, 2017
" ============================================================================

" ----- GENERAL --------------------------------------------------------------

set nocompatible   " enable Vim specific settings instead of vi compatibility
set tabstop=4      " set tab length in spaces (manual indent)
set shiftwidth=4   " set the number of spaces inserted for a tab (autoindent)
set expandtab      " convert tabs to spaces
set softtabstop=0  " turn mixing of tabs and spaces off
set ruler          " show cursor position all the time
set showcmd        " show incomplete commands
set showmode       " show mode
set nojoinspaces   " use only one space instead of two if joining lines
set scrolloff=2    " keep lines above/below the cursor visible when scrolling
set history=500    " command line history persistence
set ff=unix        " use unix file format
set encoding=utf-8 " set UTF-8 file encoding
set cm=blowfish2   " enable strong crypt method for command :X
set backspace=indent,eol,start " backspace to go over everything
set list listchars=tab:»\ ,trail:· " visualize tabs and trailing spaces

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" ----- PERSISTENT UNDO ------------------------------------------------------

if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "p")
endif
set undodir=$HOME/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

function! ClearUndo()
    let old_undolevels = &undolevels
    set undolevels=-1
    exe "normal a \<BS>\<Esc>"
    let &undolevels = old_undolevels
    unlet old_undolevels
endfunction

" -u to clear undo history
map -u :call ClearUndo()<CR>

" ----- COLORS --------------------------------------------------------------

if &t_Co > 2 || has("gui_running") " if terminal has colors
    syntax on     " syntax highlight
    set hlsearch  " search pattern highlight
    set incsearch " dynamic search pattern highlight
    let g:load_doxygen_syntax=1

    " mark first overlength character (@81)
    highlight OverLength ctermfg=white ctermbg=darkgray
    match OverLength /\%81v./

    " highlight non-ASCII characters
    highlight NonAscii ctermfg=black ctermbg=red
    match NonAscii "[^\x00-\x7f]"

    " set highlight for search
    highlight Search cterm=NONE ctermfg=white ctermbg=blue
endif

" ----- AUTOCOMMANDS --------------------------------------------------------

if has("autocmd")
    " enable file type detection, use the default filetype settings,
    " so that mail gets 'tw' set to 72, 'cindent' is on in C files, etc.
    " also load indent files to automatically do language-dependent indenting
    filetype plugin indent on

    " for all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " restore cursor position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
else
    set autoindent
endif

" ----- MAPPINGS -------------------------------------------------------------

" <F2> tp toggle paste mode
set pastetoggle=<F2>

" <F8> to toggle tagbar
nmap <F8> :TagbarToggle<CR>

" <Ctrl+L> to format actual paragraph
nnoremap <C-L> gqip

" <Tab> to change window
nnoremap <Tab> <C-w><C-w>

" <Shift+Tab> to show explorer in new tab
nnoremap <S-Tab> :Texplore<CR>

" use indentation based folding
"set foldmethod=indent foldlevel=99
" <\> to open/close fold
"nnoremap \ za

" list buffers and offers the selection to open
nnoremap gb :ls<CR>:b<Space>

" list buffers and offers the selection to close
nnoremap gd :ls<CR>:bd<Space>

" vertically split window on pipe
nnoremap \| :vsplit<CR>

" map Alt+2 to file explorer and Alt+1 to return to explorer
nnoremap 2 :Explore <CR>
nnoremap 3 :Texplore<CR>
nnoremap 1 :Rexplore<CR>

" map Alt+0 to :nohighlight
nnoremap nh :noh<CR>

" run ctags for ct
nnoremap ct :!ctags -R -f ./.git/tags .<CR><CR>

" :ToUnix to convert to unix file format (and save it)
silent command! ToUnix w ++ff=unix

" :ToAscii to replace each non-ascii characters to space
silent command! ToAscii %s/[^\x00-\x7f]/ /g

" ----- MOUSE ----------------------------------------------------------------

if has('mouse')
    " Set mouse to work in all modes, resulting easy positioning by clicking
    " and easy Visual mode selection. However, by easy Visual mode selection,
    " default terminal mouse behavior is lost. Default terminal mode mouse
    " behavior can be achieved by pressing <Shift> during clicking
    " (selection). Copy-Paste also works for the selection with Ctrl+Shift+C -
    " Ctrl+Shit+V. MacOS: To temporarily bypass Mouse Reporting and interact
    " with the terminal view, press the <Fn> modifier key while clicking or
    " scrolling. There is also a View > Allow Mouse Reporting (⌘R) menu item
    " you can use to bypass Mouse Reporting for longer periods of time, or if
    " the modifier key isn't available.
    set mouse=a   " all modes
    set mousehide " hide  while typing
    set mousemodel=popup " right mouse button pops up a menu, like in Windows
endif

" ----- CLIPBOARD ------------------------------------------------------------

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
" but for other cases XQuartz should have all Pasteboard options to be enabled
" under its Preferences
"
if has('clipboard')
    set clipboard=unnamed,unnamedplus,autoselect

    " If X11 forwarding is active and the connection is slow, the process of
    " Vim connecting to the clipboard becomes slow too, resulting delayed
    " startup. Excluding the clipboard will solve this, but obviously the
    " assignment of registers to it will brake.
    "set clipboard=exclude:.* " not to try connecting to the X clipboard
endif

" ----- PLUGINS --------------------------------------------------------------

" Settings for netrw the built-in file explorer plugin
" NOTE: :Te - open explorer in new tab
"       :Ve - open explorer on the left
"       gt/gT - go to next/prev tab
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_winsize = 25
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1

" Run Vim plugin autoloader: ~/.vim/autoload/pathogen.vim
" See:     https://github.com/tpope/vim-pathogen
" Install: mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"          curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" Plugin packages go to ~/.vim/bundle
" Standalone .vim plugins go to ~/.vim/plugin
silent! execute pathogen#infect()

" vim-markdown is an enhanced syntax highlighting plugin, install (pathogen):
" cd ~/.vim/bundle && git clone https://github.com/plasticboy/vim-markdown
" Its folding feature on big files makes Vim slow, that's why it is disabled:
let g:vim_markdown_folding_disabled=1

" vim-airline is a fancy status line plugin, install (pathogen):
" cd ~/.vim/bundle && git clone https://github.com/bling/vim-airline
" To make the status line visible, laststatus needs to be set:
silent! set laststatus=2

" undotree is an undo tree visualizer plugin, install (pathogem):
" cd ~/.vim/bundle && git clone https://github.com/mbbill/undotree
" Ctrl-U to toggle undo tree visualization
nnoremap <C-u> :UndotreeToggle<CR>

" molokai color scheme to be used if available, install (pathogen):
" cd ~/.vim/bundle && git clone https://github.com/tomasr/molokai
silent! colorscheme molokai
