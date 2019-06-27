## Path to your oh-my-zsh installation.
export ZSH="/home/daksh/.oh-my-zsh"

## THEMES & PLUGINS
ZSH_THEME="zeta"
plugins=(git)

source $ZSH/oh-my-zsh.sh

## ALIASES
alias vi="nvim"
alias vim="nvim"
alias gc="git clone"
alias gc="git clone"
alias ga="git add"
alias gcm="git commit -m"
alias gacm="git commit -a -m"
alias gca="git commit --amend"
alias gpom="git push origin master"
alias grao="git remote add origin"
alias grro="git remote remove origin"
alias gdf="git diff"
alias gsu="git status"
alias gpo="git push origin"
alias kctl="kubectl"

## Golang
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=auto
