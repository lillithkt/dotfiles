#!/bin/sh

echo "Installing zsh plugins..."

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing dotfiles..."
ln -sf $PWD/.aliases ~/
ln -sf $PWD/.zshrc ~/
ln -sf $PWD/.tmux.conf ~/
