# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mst-mkt/.zshrc'

autoload -Uz compinit
compinit

# zsh plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# the fuck
eval "$(thefuck --alias fuck)"

# zoxide
eval "$(zoxide init zsh)"

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# alias
alias wget="aria2c"
alias man="tldr"

alias ga="git add"
alias gap="git add -p"
alias gc="git commit -m"
alias gca="git commit --amend --no-edit"
alias s="git status"
alias l="git log"
alias gps="git push"
alias gpl="git pull"
alias gf="git fetch"
alias gm="git merge"
alias gmf="git merge FETCH_HEAD"

alias dc="sudo docker-compose"
alias dcup="sudo docker-compose up -d"
alias dcps="sudo docker-compose ps"
alias dcrm="sudo docker-compose rm"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias ls="exa --icons --git"
alias la="exa --icons --git  -a"
alias ll="exa --icons --git -aahl"
alias lt="exa -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
