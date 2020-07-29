call plug#begin()
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'mattn/emmet-vim'
Plug 'yggdroot/indentline'
Plug 'matze/vim-move'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'voldikss/vim-floaterm'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
" Plug 'metakirby5/codi.vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'liuchengxu/vim-which-key'
Plug 'moll/vim-bbye'
call plug#end()
" Config
source $HOME/.config/nvim/modules/config.vim

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

" Git
source $HOME/.config/nvim/modules/signify.vim

" Colors
source $HOME/.config/nvim/modules/theming.vim
