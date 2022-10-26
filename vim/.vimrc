set nocompatible  " required
filetype plugin on

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
	Plug 'voldikss/vim-floaterm'
	Plug 'tpope/vim-fugitive'

	" Plug 'airblade/vim-gitgutter'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'morhetz/gruvbox'

	"> Go
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'othree/xml.vim'

	Plug 'vim-airline/vim-airline'
	Plug 'Everduin94/nvim-quick-switcher'
	Plug 'nicwest/vim-camelsnek'

	Plug 'hrsh7th/nvim-cmp'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" enable highlighting and stripping whitespace on save
let g:better_whitespace_enabled=1

let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let mapleader="\<Space>"


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
" colorscheme xoria256
set background=dark
" colorscheme PaperColor
colorscheme gruvbox

autocmd Filetype cpp noremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>49ja<Tab>
autocmd FileType go noremap \r :GoRun %<CR>
noremap <leader>s :w<CR>
noremap <leader>q :q<CR>

"Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif"`'")"'")

"Emmet vim default leader key
let g:user_emmet_leader_key=','
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

autocmd FileType markdown,md set shiftwidth=2
autocmd FileType html,javascript,typescript,typescriptreact set ts=2
autocmd FileType html,javascript,typescript,typescriptreact set shiftwidth=2

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>


" run tests
" autocmd BufWrite *.go !go test && git commit -am working || git reset --hard

" jump to next error https://github.com/neoclide/coc.nvim/issues/64
nmap <silent> [c :call CocAction('diagnosticNext')<cr>
nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" mapping of vim fugitive
nmap <leader>gs :G<CR>

" nvim-quick-switcher configurations
nnoremap <silent> <leader>ou :lua require('nvim-quick-switcher').switch('component.ts')<CR>
nnoremap <silent> <leader>oi :lua require('nvim-quick-switcher').switch('component.css')<CR>
nnoremap <silent> <leader>oo :lua require('nvim-quick-switcher').switch('component.html')<CR>
nnoremap <silent> <leader>op :lua require('nvim-quick-switcher').switch('module.ts')<CR>
nnoremap <silent> <leader>k :Kebab<CR>

syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax

" remap vertical split tab fzf vim
let g:fzf_action = {
      \ 'ctrl-b': 'vsplit'
  \ }


lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-k>",
      node_incremental = "<c-k>",
      scope_incremental = "<c-h>",
      node_decremental = "<c-j>",
    },
  },
}
EOF
