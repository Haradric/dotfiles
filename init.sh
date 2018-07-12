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

    [ $(uname) = 'Darwin' ] || {
        ppa=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep git-core)
        [ -z "$ppa" ] && {
            echo "Adding PPA from the maintainers of git"
            sudo add-apt-repository ppa:git-core/ppa
        }
    }
    backup $config_file $HOME/.gitignore
    ln -s $DIR/gitconfig $config_file
    ln -s $DIR/gitignore $HOME/.gitignore
}

configure_zsh() {
    config_dir="$HOME/.zsh"
    config_file="$HOME/.zshrc"

    [ $SHELL = "/bin/zsh" ] || {
        echo "Setting zsh as default shell"
        sudo chsh -s /bin/zsh
    }

    backup $config_dir $config_file $HOME/.zfunctions
    ln -s $DIR/zsh   $config_dir
    ln -s $DIR/zshrc $config_file

    vim +PluginInstall +qall
}

configure_vim() {
    config_dir="$HOME/.vim"
    config_file="$HOME/.vimrc"

    backup $config_dir $config_file
    ln -s $DIR/vim   $config_dir
    ln -s $DIR/vimrc $config_file
}

configure_git
configure_zsh
configure_vim

