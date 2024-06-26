# Aliases


# ls aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

# 'micro' is not a good sequence for typing fast
alias m=micro

# same for 'nvim'
alias n='nvim -p'

# Formatted zsh history
alias hist='fc -liD'

# Too Many Timestamps
alias t=timestamps


# --- Aliases for git ---

alias gadd='git add'
alias gmv='git mv'
alias grm='git rm'

alias gba='git branch -a'
alias gbd='git branch -d'
alias gbdd='git branch -D'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gcl='git clone'
alias gclwin='git clone --config core.autocrlf=true'

alias gcm='git commit -v'
alias gcma='git commit -v --amend'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

alias gpu='git pull'
alias gpp='git pull -p'

alias gpsh='git push'

alias gss='git status -s'
alias gsv='git status -v'
alias gsvv='git status -vv'
