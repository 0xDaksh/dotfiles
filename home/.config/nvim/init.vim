call plug#begin()
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'yggdroot/indentline'
Plug 'matze/vim-move'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'voldikss/vim-floaterm'
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'moll/vim-bbye'
call plug#end()

" Config
source $HOME/.config/nvim/modules/config.vim

" COC
source $HOME/.config/nvim/modules/coc.vim

" Tex
source $HOME/.config/nvim/modules/tex.vim

" FZF
source $HOME/.config/nvim/modules/fzf.vim

" Git
source $HOME/.config/nvim/modules/signify.vim

" Colors
source $HOME/.config/nvim/modules/theming.vim
