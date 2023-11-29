if [[ -f ~/.zshPreload ]]; then
  source ~/.zshPreload
fi
if [[ -f ~/.zshPreload.platform ]]; then
  source ~/.zshPreload.platform
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions
)
$ () {
    "$@"
}

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

autoload -Uz compinit
compinit

if [[ -f ~/.profile ]]; then
  source ~/.profile
fi
source ~/.aliases
source ~/.path

# Platform specific dotfiles
if [[ -f ~/.path.platform ]]; then
  source ~/.path.platform
fi
if [[ -f ~/.aliases.platform ]]; then
  source ~/.aliases.platform
fi

COLOR=75
if [[ $UID == 0 || $EUID == 0 ]]; then COLOR=125; fi

PROMPT='%F{'"$COLOR"'}● %f%F{'"$COLOR"'}%n%f%F{white}@%f%F{'"$COLOR"'}%m%f: %F{177}%~%f $ '