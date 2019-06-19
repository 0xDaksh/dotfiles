# disable greeting
function fish_greeting
end

# Prompt
function fish_prompt
  powerline-go -error $status -shell bare
end

# rust
set PATH $HOME/.cargo/bin $PATH

# conda
source /home/daksh/miniconda3/etc/fish/conf.d/conda.fish

# colorscheme
set theme_color_scheme dark

# alias
alias vi 'nvim'
alias vim 'nvim'
alias gc "git clone"
alias ga "git add"
alias gcm "git commit -m"
alias gacm "git commit -a -m"
alias gca "git commit --amend"
alias gpom "git push origin master"
alias grao "git remote add origin"
alias grro "git remote remove origin"
alias gdf "git diff"
alias gsu "git status"
alias gpo "git push origin"
alias kctl "kubectl"
alias l "ls -l --icon never"
alias ls "lsd --icon never"

# add npm global to path
set PATH ~/.npm-global/bin $PATH

# add go bin to path
set PATH ~/go/bin $PATH

# set go mod
set GO111MODULE auto

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/daksh/google-cloud-sdk/path.fish.inc' ]; . '/home/daksh/google-cloud-sdk/path.fish.inc'; end
