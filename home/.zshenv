#!/bin/zsh
export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | paste -sd ':')"
export PATH="$PATH:/opt/ghc/bin:/opt/cabal/bin"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome"
export READER="zathura"
