"""
install bundles as git submodules
"""
import subprocess as sp

bundles = {
        'vim-markdown'  : 'git://github.com/plasticboy/vim-markdown.git',
        'Latex-Box'     : 'git://github.com/vim-scripts/LaTeX-Box.git',
        'vim-pathogen'  : 'git://github.com/tpope/vim-pathogen.git',
        'The-NERD-tree' : 'git://github.com/vim-scripts/The-NERD-tree.git',
        'supertab'      : 'http://github.com/ervandew/supertab/',
        'UltiSnips'     : 'http://github.com/vim-scripts/UltiSnips/',
        'fugitive'      : 'https://github.com/tpope/vim-fugitive/',
        'vim-powerline' : 'https://github.com/Lokaltog/vim-powerline/',
        'tabular'       : 'https://github.com/godlygeek/tabular/',
        'tcomment_vim'  : 'http://github.com/tomtom/tcomment_vim/',
        'delimitMate'   : 'https://github.com/vim-scripts/delimitMate.vim/',
        'vim-surround'  : 'http://github.com/tpope/vim-surround/',
        'vim-solarized' : 'http://github.com/altercation/vim-colors-solarized/',
        'vim-git'       : 'https://github.com/tpope/vim-git/',
        'gist'          : 'http://github.com/vim-scripts/Gist.vim/'
        'taskpaper'     : 'https://github.com/davidoc/taskpaper.vim'
        }

for bundle in bundles:
    url = bundles[bundle]
    call = 'git submodule add %s bundle/%s'%(url, bundle)
    print call
    sp.call(call, shell=True)

sp.call('git submodule init', shell=True)
sp.call('git submodule foreach git pull origin master', shell=True)

