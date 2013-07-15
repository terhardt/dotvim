" Vim configuration
" Tobias Erhardt 2013-04-06

" Preamble ---------------------------------------------------------------{{{
" Load Pathogen and set noncompatible option

filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set nocompatible " be improved
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" }}}

" Basics -----------------------------------------------------------------{{{
" Basic Options
set encoding=utf-8             " utf-8 as default
set ruler                      " enable ruler
set cursorline                 " highlight current line
set number                     " display line numbers
set backspace=indent,eol,start " backspace over everything
set autoindent                 " enable auto indentation
set smartindent                " automatic indentation
set showcmd                    " show command in status line
set autoread                   " auto reload changed files
set autowriteall               " auto write on buffer change
set listchars=tab:▸\ ,eol:¬    " characters for invisibles
set visualbell                 " don't beep
set noerrorbells               " don't beep
set modeline
set title                      " set terminals title
set ttimeoutlen=100
set timeoutlen=100

set clipboard^=unnamed            " hook up vim clipboad to system clipboad
" vimrc editing ----------------------------------------------------------{{{
" quickly edit the vimrc file
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
" quickly source the vimrc file
nnoremap <silent> <leader>vs :so $MYVIMRC<CR>
" }}}

" movement ---------------------------------------------------------------{{{
" If I'm using vim than the right way
inoremap <up> <nop>
inoremap<down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" make up and down behave nicely.
nnoremap j gj
nnoremap k gk
" }}}

" Tabs, spaces, wrapping {{{
set tabstop=4          " width of whitespace by tab
set shiftwidth=4       " width of tab
set softtabstop=4      " for backspacing
set expandtab          " indent with spaces
set wrap               " enable line wrapping
set colorcolumn=80     " highlight 79 th column
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
" If the terminal has enough colours set color scheme
if &t_Co >= 256 || has("gui_running")
    colorscheme solarized           " set to solarized
    set background=dark             " dark background as default
    call togglebg#map("<S-F5>")     " switch between dark / light on <S-F5>
endif
" If the terminal has any colors enamble syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on                       " enable syntax highlighting
endif
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}

" Searching {{{
" Searching uses the python regex syntax
nnoremap / /\v
vnoremap / /\v
" turn of vims regex engine for searches
set ignorecase                " ignore case for all lowercase search
set smartcase                 " case sensitive for upper-case search
set gdefault                  " default to global substitution
set incsearch                 " incremental search
set showmatch                 " show matches
set hlsearch                  " highlight results
nnoremap <leader><space> :noh<cr> " clear search string
" }}}

" }}}

" Bindings {{{
" toggle invisible characters
nmap <silent><leader>i :set list!<CR>
" text wrapping
nmap <silent><leader>nw :set nowrap<CR>
nmap <silent><leader>w :set wrap<CR>
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
"
" Ultisnips{{{
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}
"
" NERDTree {{{
noremap <F2> :NERDTreeToggle %:p:h <CR>
inoremap <F2> <esc>:NERDTreeToggle %:p:h <CR>
" }}}
"
" SuperTab {{{
let g:SuperTabDefaultCompletionType="context" " use context tab completion
let g:SuperTabContextDefaultCompletionType="<c-x><c-o>" " use omni competion
let g:SuperTabMappingTabLiteral="<c-tab>"
" }}}
"
" PowerLine {{{
" set laststatus=2
" set t_Co=256
" let g:Powerline_symbols="compatible"
" let g:Powerline_mode_n  = ' N '
" let g:Powerline_mode_i  = ' I '
" let g:Powerline_mode_R  = ' R '
" let g:Powerline_mode_v  = ' V '
" let g:Powerline_mode_V  = 'V-L'
" let g:Powerline_mode_cv = 'V-B'
" let g:Powerline_mode_s  = ' S '
" let g:Powerline_mode_S  = 'S-L'
" let g:Powerline_mode_sc = 'S-B'
" }}}
"
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
"
" Latex-Box {{{
let g:tex_flavor="latex"
let g:LatexBox_viewer="Skim"
let g:LatexBox_quickfix=1
let g:LatexBox_show_warnings=0
let g:LatexBox_ignore_warnings=['Underfull', 'Overfull', 'specifier changed to', 'Font Shape']
let g:LatexBox_Folding=1
" }}}
"
" crtlp {{{
let g:ctrlp_max_height = 20
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:crtlp_mruf_relative = 1
" }}}
"
" python-mode {{{
let g:pymode_doc = 0
let g:pymode_lint=0
let g:pymode_folding=1
let g:pymode_rope=0
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=1
let g:pymode_syntax_builtin_funcs=1
" }}}
"
" jedi {{{
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 1
let g:jedi#show_function_definition = "0"
let g:jedi#pydoc = "K"
let g:jedi#rename_command = "<leader>rr"
" }}}
"
"syntastic {{{
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_post_args='--ignore=E221'
let g:syntastic_enable_sings=0
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={'mode' : 'active',
                         \ 'passive_filetypes':['tex']}
" close quick list with C-q
nnoremap <silent> <C-q> :lclose<CR>:bdelete<CR>
"}}}
"
" tagbar {{{
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 20
let g:tagbar_compact = 0
let g:tagbar_iconchars = ['▸', '▾']
noremap <silent> <F4> :TagbarToggle<CR>
" languange definitions for tagbar {{{
" LaTeX : {{{
let g:tagbar_type_tex = {
            \ 'ctagstype' : 'latex',
            \ 'kinds'     : [
                \ 's:sections',
                \ 'g:graphics:0:0',
                \ 'l:labels',
                \ 'r:refs:1:0',
                \ 'p:pagerefs:1:0'
            \ ],
            \ 'sort'    : 0,
        \ }
"}}}
" }}}
"}}}
"
" vimux {{{
" Prompt for a command to run
map <leader>rp :PromptVimTmuxCommand
" Run last command executed by RunVimTmuxCommand
map <leader>rl :RunLastVimTmuxCommand
" Inspect runner pane
map <leader>ri :InspectVimTmuxRunner
" Close all other tmux panes in current window
map <leader>rx :CloseVimTmuxPanes
" Interrupt any command running in the runner pane
map <leader>rs :InterruptVimTmuxRunner
" Height of tmux pane
let g:VimuxHeight ="40"
" }}}
"
" pandoc {{{
" Point pandoc to global references file to enable reference completion
let g:pandoc_bibfliles = ['/Users/terhardt/Literature/references.bib']
" }}}
" }}}

" GUI Options {{{
" These Options are only run, when the gui is active
" the clipboard option is only working in windows Gvim or MacVim
if has('gui_running')
    set guioptions=aAce              " disable tool bar in macvim
    set guifont="Source Code Pro":12 " set guifont to Inconsolata 11
endif
" }}}

" Autocommands {{{
" save if focus is lost
autocmd FocusLost * silent! wa     
" }}}
