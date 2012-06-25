"""
install bundles as git submodules
"""
import subprocess as sp

bundles = {
        'vim-markdown'  : 'http://github.com/plasticboy/vim-markdown/',
        'Latex-Box'     : 'http://github.com/vim-scripts/LaTeX-Box',
        'pathogen'      : 'http://github.com/vim-scripts/pathogen.vim',
        'The-NERD-tree' : 'http://github.com/vim-scripts/The-NERD-tree',
        'supertab'      : 'http://github.com/ervandew/supertab',
        'UltiSnips'     : 'http://github.com/vim-scripts/UltiSnips',
        'fugitive'      : 'https://github.com/tpope/vim-fugitive',
        'vim-powerline' : 'https://github.com/Lokaltog/vim-powerline/',
        'tabular'       : 'https://github.com/godlygeek/tabular',
        'tcomment_vim'  : 'http://github.com/tomtom/tcomment_vim',
        'delimitMate'   : 'https://github.com/vim-scripts/delimitMate.vim',
        'vim-surround'  : 'http://github.com/tpope/vim-surround',
        'vim-solarized' : 'http://github.com/altercation/vim-colors-solarized'
        }

for bundle in bundles:
    url = bundles[bundle]
    call = 'git submodule add %s bundle/%s'%(url, bundle)
    sp.call(call)

sp.call('git submodule init')
sp.call('git submodule foreach pull origin/master')

