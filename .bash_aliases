alias gpg='gpg2'
alias pgp='gpg2'
alias vi='vim'
alias mkae='make'
alias jekyll='bundle exec jekyll serve'

# if colordiff is installed, use it
command -v colordiff >/dev/null 2>&1 && alias diff='colordiff'

# if gshred is available, use it as shred
command -v gshred >/dev/null 2>&1 && alias shred='gshred'
