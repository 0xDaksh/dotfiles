#!/bin/zsh
export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | paste -sd ':')"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome"
export READER="zathura"
