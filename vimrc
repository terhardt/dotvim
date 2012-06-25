" vim config
" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()          "load bundles 
call pathogen#helptags()        " load plugin help files
filetype plugin indent on

"invisible characters
nmap <leader>l :set list!<CR>   " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬

" map leader
let mapleader=","

"put vim's temporary and swap files in places no one actually cares about
set backupdir=~/.vim/vim-bak//
set directory=~/.vim/vim-swp//

set autoread                    " auto reload changed files
" UltiSnips
let g:UltiSnipsUsePythonVersion = 2

"NERDTree
map <F2>   :NERDTreeToggle % <CR>

"NERDCommenter
let NERDSpaceDelims=1           " delimit comment with extra space
let NERDRemoveExtraSpaces=1     " remove extra spaces when removing comment
nmap <D-Bar> <leader>ci         " map command \ to toggle line comment 
vmap <D-Bar> <leader>ci gv      " same as above for visual mode    

" SuperTab
let SuperTabDefaultCompletionType = "context" " use context tab completion

" powerline
set nocompatible
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'

" syntax highlighting
syntax on                       " enable syntax highlighting
filetype on                     " enable file type detection
filetype plugin indent on

" Indentation Editing
set number                      " display line numbers
set smartindent                 " automatic indentation
set tabstop=4                   " width of whitespace by tab
set shiftwidth=4                " width of tab
set softtabstop=4               " for backspacing
set expandtab                   " indent with spaces
set smarttab                    " not sure what this does
set backspace=indent,eol,start  " backspace over everything
set enc=utf-8                   " utf-8 as default

" linebreaks
set wrap                        " turn on soft wrapping
set linebreak                   " switch on line breaks
set cursorline                  " highlight current line
set colorcolumn=79              " highlight 79 th column  

" Colorscheme
colorscheme solarized           " set to solarized
set background=dark             " dark background as default
call togglebg#map("<S-F5>")     " switch between dark / light on <S-F5>

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
endif
