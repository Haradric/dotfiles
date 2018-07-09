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

configure_zsh() {
    config_dir="$HOME/.zsh"
    config_file="$HOME/.zshrc"

    #enable zsh as default shell

    #configure pure

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

    rm -rf $HOME/.vim/autoload
    ln -s $DIR/vim/bundle/vim-pathogen/autoload $HOME/.vim/autoload
}

configure_zsh
configure_vim
