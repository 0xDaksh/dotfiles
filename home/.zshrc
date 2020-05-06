# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/daksh/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

export GOPATH=/home/daksh/go
export PATH=~/.npm-global/bin:$GOPATH/bin:$PATH
export EDITOR="nvim"

alias vi="nvim"
alias nv="nvim"

ccc() {
	g++ -std=c++17 -O2 -Wall $1 -o $2
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.homesick/repos/homeshick/homeshick.sh"