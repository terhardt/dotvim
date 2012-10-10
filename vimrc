" vim config
set nocompatible " be improved

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()          " load bundles 
call pathogen#helptags()        " load plugin help files
filetype plugin indent on

" map leader
let mapleader=","

"put vim's temporary and swap files in places no one actually cares about
set backupdir=~/.vim/vim-bak//
set directory=~/.vim/vim-swp//

" Indentation Editing
set number                     " display line numbers
set smartindent                " automatic indentation
set tabstop=4                  " width of whitespace by tab
set shiftwidth=4               " width of tab
set softtabstop=4              " for backspacing
set expandtab                  " indent with spaces
set smarttab                   " not sure what this does
set backspace=indent,eol,start " backspace over everything
set enc=utf-8                  " utf-8 as default
set autoread                   " auto reload changed files
set autowriteall               " auto write on buffer change
set wrap                       " turn on soft wrapping
set linebreak                  " switch on line breaks
set cursorline                 " highlight current line
set textwidth=80               " 80 chars textwidth
set colorcolumn=79             " highlight 79 th column
set formatoptions=tcq          " formatoptions for textwrap
set showcmd                    " show command in status line
:au FocusLost * silent! wa     " save if focus is lost
" Searching
nnoremap / /\v
vnoremap / /\v
" turn of vims regex engine for searches
set ignorecase                    " ignore case for all lowercase search
set smartcase                     " case sensitive for upper-case search
set gdefault                      " default to global substitution
set incsearch                     " incremental search
set showmatch                     " show matches
set hlsearch                      " highlight results
nmap <leader><space> :noh<cr> " clear search string

" invisible characters
set listchars=tab:▸\ ,eol:¬
" toggle `set list`
nmap <silent><leader>sl :set list!<CR>  

" Spellchecking
set spelllang=en_us
nmap <silent><leader>s :set spell!<CR>
" toggle spellchecking

" Colorscheme
syntax on                       " enable syntax highlighting
colorscheme solarized           " set to solarized
set background=dark             " dark background as default
call togglebg#map("<S-F5>")     " switch between dark / light on <S-F5>


" Cleanup trailing whitespace
nmap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Open iTerm at the current files path
nmap <silent><leader>T :!open %:p:h -a iTerm.app <CR> <CR>

" UltiSnips
let g:UltiSnipsUsePythonVersion = 2

"NERDTree
map <F2>   :NERDTreeToggle %:p:h <CR>

" SuperTab
let g:SuperTabDefaultCompletionType = "context" " use context tab completion
let g:SuperTabMappingTabLiteral = '<c-tab>'

" Powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'

" Latex-Box
let g:LatexBox_viewer = 'skim'
let g:tex_flavor = 'latex'

" indentation formats as in TextMate
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" split pane navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" GUI Options
if has('gui_running')
    set guioptions=aAce         " disable tool bar in macvim
    set guifont=Inconsolata:h11 " set guifont to Inconsolata 11
endif

" Spellchecking
nmap <silent> <leader>s :set spell!<CR> " toggle spellchecking
set spelllang=en_us

" Autocommand options
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC " auto source .vimrc on save
    autocmd FileType python set foldmethod=indent
endif
