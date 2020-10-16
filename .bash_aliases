# Some terminal shotcuts
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gs='git status'
alias gd='git diff'
alias gc='git commit -m '
alias gb='git branch -vv'
alias gr='git remote -v'
alias ga='git add'
alias gaa='git add --all'
alias gl='git log --oneline --decorate --all --graph'
alias gco='git checkout'
alias gsu='git submodule update'

# server security update shortcuts
alias updateServer='sudo apt-get upgrade && sudo apt-get autoremove && sudo reboot'
alias rebootServer='sudo apt-get autoremove && sudo reboot'
