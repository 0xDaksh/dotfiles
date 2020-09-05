# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LC_CTYPE="en_US.UTF-8"
export ZSH="/home/daksh/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# st fixes
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

export PIPENV_VENV_IN_PROJECT=1
