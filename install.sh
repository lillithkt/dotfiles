#!/bin/bash

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
fi


if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "Installing zsh plugins..."

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

fi

echo "Installing dotfiles..."
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -sf $SCRIPT_DIR/.aliases ~/
ln -sf $SCRIPT_DIR/.zshrc ~/
echo "" > ~/.profile
echo "" > ~/.zshrc.local
echo "" > ~/.aliases.local

if [ ! -x "$(command -v tmux)" ]; then
    read -n 1 -r -p "You dont have tmux installed, would you like to install the config anyway? (Y/n) "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ln -sf $SCRIPT_DIR/.tmux.conf ~/
    fi
    echo ""
else
    ln -sf $SCRIPT_DIR/.tmux.conf ~/
fi

exec zsh
