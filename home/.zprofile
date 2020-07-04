#!/bin/zsh

export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | paste -sd ':')"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"


