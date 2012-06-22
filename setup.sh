# Setup script to be run after cloning the repository to ~/.vim

# link vimrc file
cd 
ln -s .vim/vimrc .vimrc

# make folders
cd .vim
mkdir vim-bak
mkdir vim-swp

git submodules init
git submodules update
