call plug#begin()
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'yggdroot/indentline'
Plug 'matze/vim-move'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'honza/vim-snippets'
Plug 'sebdah/vim-delve'
Plug 'justinmk/vim-sneak'
call plug#end()
" Config
source $HOME/.config/nvim/modules/config.vim

" sneak
source $HOME/.config/nvim/modules/sneak.vim

" tagbar
source $HOME/.config/nvim/modules/tagbar.vim

" COC
source $HOME/.config/nvim/modules/coc.vim

" Tex
source $HOME/.config/nvim/modules/tex.vim

" Go
source $HOME/.config/nvim/modules/go.vim

" FZF
source $HOME/.config/nvim/modules/fzf.vim

" Colors
source $HOME/.config/nvim/modules/theming.vim
