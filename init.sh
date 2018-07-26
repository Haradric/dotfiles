#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# zsh
cp "$DIR"/zshrc "$HOME"/.zshrc

# antigen for zsh
curl -L git.io/antigen > "$HOME"/.antigen.zsh
cp "$DIR"/antigenrc "$HOME"/.antigenrc

# git
cp "$DIR"/gitconfig "$HOME"/.gitconfig
cp "$DIR"/gitignore "$HOME"/.gitignore

# vim
cp -r "$DIR"/vimrc "$HOME"/.vimrc
mkdir -p "$HOME"/.vim/bundle

# Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git \
        "$HOME"/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YouCompleteMe for vim
"$HOME"/.vim/bundle/YouCompleteMe/install.py --clang-completer
cp ycm_extra_conf.py "$HOME"/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py

