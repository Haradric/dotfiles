
```
git clone https://github.com/Haradric/dotfiles.git && cd dotfiles

cp .zshrc     ~/.zshrc
cp .antigenrc ~/.antigenrc
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore
cp .vimrc     ~/.vimrc

curl -L git.io/antigen > ~/.antigen.zsh

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "PluginInstall" -c "qall"
```
