set nocompatible  " required
"
" Automatic Plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

	Plug 'tpope/vim-commentary'

	Plug 'dracula/vim', {'as':'dracula'}
	Plug 'jiangmiao/auto-pairs'

	Plug 'sheerun/vim-polyglot'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'christoomey/vim-system-copy'
	Plug 'bkad/CamelCaseMotion'
	Plug 'tpope/vim-surround'
	Plug 'pseewald/vim-anyfold'
	Plug 'tpope/vim-dispatch'
	Plug 'mattn/emmet-vim'
	Plug 'dkarter/bullets.vim' " for bulleting lists
	Plug 'vim-scripts/indentpython.vim'
	Plug 'dense-analysis/ale'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
	Plug 'junegunn/fzf.vim'

"	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer --go-completer --rust-completer --ts-completer' }



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
colorscheme dracula

" change today 30/01/2021
noremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>48ja<Tab>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")

"Emmet vim default leader key
let g:user_emmet_leader_key=','

autocmd Filetype cpp,python nmap <Space>c <Esc>:w<CR>:only<CR>
autocmd Filetype python nmap t <Esc>:w<CR>:!clear;/usr/bin/env python3 %<CR>
" autocmd Filetype cpp nmap t <Esc>:w<CR>:Dispatch g++ -std=c++14 -O2 -Wall % -o '%:t:r'<CR>
" autocmd Filetype cpp nmap t <Esc>:w<CR>:Dispatch gnome-terminal -- sh -c ./'%:t:r; sleep 10'<CR>
autocmd Filetype cpp nmap t <Esc>:w<CR>:Dispatch g++ -DLOCAL_PROJECT -std=c++14  % -o '%:t:r' && ./'%:t:r'<CR>
autocmd Filetype cpp nmap m <Esc>:w<CR>:Dispatch g++ -std=c++14 -O2 -Wall % -o '%:t:r' && ./'%:t:r'<CR>
autocmd Filetype python nmap <C-T> <Esc>:w<CR>:!clear;pytest %<CR>
autocmd Filetype java nmap t <Esc>:w<CR>:!clear;javac % && java '%:t:r'<CR>
