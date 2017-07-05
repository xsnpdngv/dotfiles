alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias vi='vim -p' # Vim to open multiple files in tabs by default
alias mkae='make'
alias gpg='gpg2'
alias pgp='gpg2'

# if colordiff is installed, use it
command -v colordiff >/dev/null 2>&1 && alias diff='colordiff'

# if gshred is available, use it as shred
command -v gshred >/dev/null 2>&1 && alias shred='gshred'

# decrypt file into vim buffer
pgpvi() {
    pgp --decrypt $@ | vim -
}
