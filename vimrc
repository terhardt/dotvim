" Vim configuration
" Tobias Erhardt 2013-04-06

" Preamble ---------------------------------------------------------------{{{
" Load Vundle and set noncompatible option

set nocompatible " be iMproved
filetype off
" Bundles -----------------------------------------------------------------{{{
call plug#begin()
" Bundle 'mja/vim-stan'
" Plug 'majutsushi/tagbar'
" Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-haml'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-scripts/Jinja'
" Plug 'vim-scripts/Vim-R-plugin'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'davidhalter/jedi-vim', {'do' : 'git submodule update --init'}
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
" Plug 'klen/python-mode'
Plug 'ledger/vim-ledger'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
" " Experimental
Plug 'lervag/vimtex'
Plug 'Shougo/neocomplete.vim'
Plug 'tmhedberg/SimpylFold'
" Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neosnippet' 
Plug 'Shougo/neosnippet-snippets' 
Plug 'maverickg/stan.vim'
call plug#end()
filetype plugin indent on
syntax enable
" }}}

" Basics -----------------------------------------------------------------{{{
" Basic Options
set encoding=utf-8             " utf-8 as default
set ruler                      " enable ruler
set cursorline                 " highlight current line
set backspace=indent,eol,start " backspace over everything
set autoindent                 " enable auto indentation
set smartindent                " automatic indentation
set showcmd                    " show command in status line
set autoread                   " auto reload changed iles
set listchars=tab:▸\ ,eol:¬    " characters for invisibles
set visualbell                 " don't beep
set noerrorbells               " don't beep
set title                      " set terminals title
" Modelines are on a per file basis only
set modeline
set modelines=3
" Fix slow inserts
set timeout timeoutlen=1000 ttimeoutlen=1000
" use only one space after period when joining lines
set nojoinspaces               
" hook up vim clipboad to system clipboad
set clipboard+=unnamed         
set number

" movement ---------------------------------------------------------------{{{
nnoremap j gj
nnoremap k gk
" }}}

" Indentation and wrapping {{{
set tabstop=4          " width of whitespace by tab
set shiftwidth=4       " width of tab
set softtabstop=4      " for backspacing
set expandtab          " indent with spaces
" highligh 80 th column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highligh ColorColumn ctermbg=9
endif
set textwidth=80
set formatoptions=qrn1 " formatoptions for textwrap
set linebreak          " switch on line breaks
" }}}

" Backup and swap dirs {{{
set backup " enable backup files
set noswapfile  " disable swap files
set backupdir=~/.vim/vim-bak//
set undodir=~/.vim/vim-undo//
set directory=~/.vim/vim-swp//
" create directories if not existent
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}

" Leader {{{
let mapleader=","
let maplocalleader="\\"
" }}}

" Color scheme {{{
set background=dark
syntax on
try
    colorscheme solarized
catch
endtry
" }}}

" Searching {{{
" Searching uses the python regex syntax
nnoremap / /\v
vnoremap / /\v
" turn of vims regex engine for searches
" ignore case for all lowercase search, case sensitive if uppercase search 
set ignorecase smartcase
set incsearch                 " incremental search
set showmatch                 " show matches
set hlsearch                  " highlight results
set gdefault                  " default to global substitution
nnoremap <leader><space> :noh<cr> " clear search string
" }}}

" }}}

" Bindings {{{
" toggle invisible characters
nmap <silent><leader>i :set list!<CR>
" toggle text wrapping
nmap <silent><leader>w :set wrap!<CR>
" Reformating
nnoremap Q gqap
vnoremap Q gq
" Spellchecking
set spelllang=en_us
nmap <silent><leader>s :set spell!<CR>
" Cleanup trailing whitespace
nmap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" indentation reselect block after indent command
vnoremap < <gv
vnoremap > >gv
" split pane navigation
map <C-h> <C-w>h
map <c-j> <C-w>j
map <c-k> <C-w>k
map <c-l> <C-w>l
" move between tabs
map <leader>m <esc>:tabnext<CR>
map <leader>n <esc>:tabprevious<CR>
" }}}

" Folding {{{
set foldmethod=marker
set foldlevelstart=0
nnoremap <space> za
vnoremap <space> za
" }}}

" Plugins ----------------------------------------------------------------{{{
" SuperTab {{{
let g:SuperTabDefaultCompletionType="context" " use context tab completion
let g:SuperTabContextDefaultCompletionType="<c-x><c-o>" " use omni competion
let g:SuperTabMappingTabLiteral="<c-tab>"
" }}}
" airline {{{
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='dark'
let g:airline_mode_map={
            \"n"      : ' N ',
            \"i"      : ' I ',
            \"R"      : ' R ',
            \"v"      : ' V ',
            \"V"      : 'V-L',
            \"\<C-V>" : 'V-C',
            \"c"      : 'CMD'}
" }}}
" vimtex {{{
let g:tex_flavor="latex"
let g:vimtex_complete_enabled=1
let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1
" }}}
" crtlp {{{
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_cahcing = 0
endif
let g:ctrlp_max_height = 20
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:crtlp_mruf_relative = 1
" }}}
" python-mode {{{
let g:pymode_doc = 0
let g:pymode_lint=0
let g:pymode_folding=1
let g:pymode_rope=0
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=1
let g:pymode_syntax_builtin_funcs=1
" }}}
" jedi {{{
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
autocmd Filetype python setlocal omnifunc=jedi#completions
" }}}
" neocomplchache {{{
" Enable at startup (lets see if that is a good idea)
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)" }}}
"syntastic {{{
let g:syntastic_enable_sings = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_post_args='--ignore=E221'
let g:syntastic_mode_map={'mode' : 'active',
                          \ 'passive_filetypes':['tex']}
nnoremap <leader>c SyntasticCheck<CR>
"}}}
" gitgutter {{{
highlight clear SignColumn
" }}}
" }}}

" GUI Options {{{
" These Options are only run, when the gui is active
" the clipboard option is only working in windows Gvim or MacVim
if has('gui_running')
    set guioptions=aAce              " disable tool bar in macvim
    set guifont="Source Code Pro":14 " set guifont to Inconsolata 11
endif
" }}}
