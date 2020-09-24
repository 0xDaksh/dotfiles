#export LC_CTYPE="en_US.UTF-8"
export ZSH="/home/daksh/.oh-my-zsh"
ZSH_THEME="robbyrussell"


plugins=(git git-flow git-flow-completion vi-mode zsh-autosuggestions zsh-syntax-highlighting zsh-z)

source $ZSH/oh-my-zsh.sh

export GOPATH=/home/daksh/go
export PATH=~/.npm-global/bin:$GOPATH/bin:~/.local/bin:$PATH
export EDITOR="nvim"

alias vi="nvim"
alias nv="nvim"

# c++ compilation
ccc() {
	g++ -std=c++17 -O2 -Wall $1 -o $2
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$("$PYENV_ROOT"/bin/pyenv init -)"
