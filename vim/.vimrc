set nocompatible  " required
"
" Automatic Plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

	" for adding comments
	Plug 'tpope/vim-commentary'

	Plug 'dracula/vim', {'as':'dracula'}
	Plug 'jiangmiao/auto-pairs'

	" syntax highlighting
	Plug 'sheerun/vim-polyglot'
	" white space highlighting
	Plug 'ntpeters/vim-better-whitespace'
	" doesn't work for me right now [wsl]
	Plug 'christoomey/vim-system-copy'
	" never used
	Plug 'bkad/CamelCaseMotion'
	" surround change, delete etc
	Plug 'tpope/vim-surround'
	" folding code
	Plug 'pseewald/vim-anyfold'
	" html
	Plug 'mattn/emmet-vim'
	Plug 'dkarter/bullets.vim' " for bulleting lists
	Plug 'vim-scripts/indentpython.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
	Plug 'junegunn/fzf.vim'
	" super cool tab completion
	Plug 'ervandew/supertab'
	" html completion never used
	Plug 'rstacruz/sparkup'
	Plug 'vim-scripts/xoria256.vim'

call plug#end()

" enable highlighting and stripping whitespace on save
let g:better_whitespace_enabled=1

" tabbing
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set noexpandtab
set number

" Using mouse
set mouse=a

" Auto reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" any-fold
" autocmd Filetype * AnyFoldActivate
set foldlevel=99

" dracula/vim
syntax enable
" colorscheme dracula
colorscheme xoria256

noremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>49ja<Tab>

"Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")

"Emmet vim default leader key
let g:user_emmet_leader_key=','

autocmd FileType markdown,md set shiftwidth=2
