" Leader Mappings
map <Space> <leader>
map <Leader>q :q<CR>
map <Leader>s :w<CR>
map <Leader>t :qall<CR>
tnoremap <ESC> <C-w>:q!<CR>
set mouse=a

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    "Add your bundles here
    Plugin 'altercation/vim-colors-solarized' "T-H-E colorscheme
    "...All your other bundles...

	Plugin 'mechatroner/rainbow_csv'
	Plugin 'https://github.com/tpope/vim-commentary' "used for comments
	Plugin 'https://github.com/vim-scripts/ReplaceWithRegister'
	Plugin 'https://github.com/christoomey/vim-sort-motion'
	Plugin 'https://github.com/christoomey/vim-system-copy.git'
	Plugin 'leafgarland/typescript-vim'
	Plugin 'mattn/emmet-vim' "emmet-vim for html and css
	Plugin 'tpope/vim-surround' "surround
	Plugin 'vim-airline/vim-airline'
	Plugin 'kien/ctrlp.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'jnurmine/Zenburn'
	" Extra
	Plugin 'vim-scripts/indentpython.vim'
	Plugin 'lepture/vim-jinja'
	Plugin 'majutsushi/tagbar'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'https://github.com/tpope/vim-dispatch'
	Plugin 'https://github.com/tpope/vim-unimpaired'


	"Plugin for c++
	Plugin 'bfrg/vim-cpp-modern'
	"Dracula theme
	" Plugin 'dracula/vim', { 'name': 'dracula' }
	"Vim-objects
	Plugin 'https://github.com/kana/vim-textobj-user'
	Plugin 'https://github.com/kana/vim-textobj-entire'
	Plugin 'https://github.com/rhysd/vim-textobj-continuous-line'
    if iCanHazVundle == 0
        echo "Installing Vundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif

    call vundle#end()
    "must be last
    filetype plugin indent on " load filetype plugins/indent settings
    " colorscheme solarized
    syntax on                      " enable syntax

" Setting up Vundle - the vim plugin bundler end

syntax enable
set background=dark
 " colorscheme solarized
let g:solarized_termcolors=256




set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set incsearch

"redefine trigger for emmet
let g:user_emmet_leader_key=','


" call togglebg#map("<F5>")
nmap <F8> :TagbarToggle<CR>
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" colorscheme dracula


let g:user_emmet_install_global=0
autocmd FileType html,css,htmldjango EmmetInstall
autocmd FileType html,css,json,htmldjango set tabstop=2 | set shiftwidth=2
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype python setlocal tabstop=4

"file search
set path+=**
set wildmenu

nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a
noremap ,app :-1read $HOME/.vim/.skeleton.flask<CR>7ja
noremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>13ja<Tab>
noremap ,tc :-1read $HOME/.vim/.skeleton.py.t<CR>4ja<Tab>
noremap ,nm :-1read $HOME/.vim/.skeleton.py.nm<CR>ja<Tab>
noremap ,py : -1read $HOME/.vim/.skeleton.py<CR>G

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <NL> i<CR><ESC>kA


silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"adds magenta color when going beyond 72 column
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn','\%81v',72)

"remapping for vmath.vim
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

autocmd Filetype python nmap t <Esc>:w<CR>:!clear;python3.6 %<CR>
autocmd Filetype cpp nmap t <Esc>:w<CR>:Dispatch g++ -std=c++14 -O2 -Wall % -o '%:t:r' && ./'%:t:r'<CR>
autocmd Filetype python nmap <C-T> <Esc>:w<CR>:!clear;pytest %<CR>
autocmd Filetype java nmap t <Esc>:w<CR>:!clear;javac % && java '%:t:r'<CR>
