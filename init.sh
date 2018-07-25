#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

backup() {
    for file in "$@"
    do
        backup="$file"_backup
        [ -e $file ] && {
            rm -rf $backup 2>&-
            mv $file $backup
        }
    done
}

configure_git() {
    config_file=$HOME/.gitconfig

    backup $config_file $HOME/.gitignore
    ln -s $DIR/gitconfig $config_file
    ln -s $DIR/gitignore $HOME/.gitignore
}

configure_zsh() {
    config_dir="$HOME/.zsh"
    config_file="$HOME/.zshrc"

    backup $config_dir $config_file $HOME/.zfunctions
    ln -s $DIR/zsh   $config_dir
    ln -s $DIR/zshrc $config_file
}

configure_vim() {
    config_dir="$HOME/.vim"
    config_file="$HOME/.vimrc"

    backup $config_dir $config_file
    ln -s $DIR/vim   $config_dir
    ln -s $DIR/vimrc $config_file

    vim +PluginInstall +qall
    ./vim/bundle/YouCompleteMe/install.py --clang-completer
    rm -f ./vim/bundle/YouCompleteMe/.ycm_extra_conf.py && \
    ln -s $DIR/vim/ycm_extra_conf.py $DIR/vim/bundle/YouCompleteMe/.ycm_extra_conf.py
}

configure_git
configure_zsh
configure_vim

