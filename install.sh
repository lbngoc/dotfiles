#!/usr/bin/env bash

PWD="$(cd -P "$(dirname "$SOURCE")" && pwd)"

function installDotfiles() {
  echo "*************************"
  echo "** INSTALLING SOFTWARE **"
  echo "*************************"
  if [[ -z "$HOME/.oh-my-zsh" ]];
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall

  echo "******************************"
  echo "** INSTALLING CONFIGURATION **"
  echo "******************************"
  installFor "hammerspoon"
  installFor "zshrc"
  installFor "vimrc"
}


## $1 = FROM
## $2 = TO
## $3 = IN
function installFor() {
  FROM=$1
  if [ "$2" == "" ]; then
    TO=".$FROM"
  else
    TO=$2
  fi

  if [ "$3" != "" ]; then
    mkdir -p ~/$3
  fi

  echo "** Linking $FROM to ~/$TO..."
  rm ~/$TO 2> /dev/null
  ln -s $PWD/$FROM ~/$TO
}

function scriptFor() {
  echo "** Installing $1..."
  . $PWD/$1.sh
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  installDotfiles
else
  read -p "** This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    installDotfiles
  fi
fi