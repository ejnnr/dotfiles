#!/bin/bash

set -eo pipefail

mkdir -p ~/.local/bin

echo "Installing bat ..."
if ! command -v bat &> /dev/null; then
	curl -L https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-gnu.tar.gz --output bat.tar.gz
	tar -xf bat.tar.gz
	rm bat.tar.gz
	mv bat-v0.23.0-x86_64-unknown-linux-gnu/bat ~/bin
	rm -r bat-v0.23.0-x86_64-unknown-linux-gnu
fi


echo "Installing exa ..."
if ! command -v exa &> /dev/null; then
	curl -L https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip --output exa.zip
	unzip exa.zip -d exa
	rm exa.zip
	mv exa/bin/exa ~/bin
	rm -r exa
fi

echo "Installing starship ..."
if ! command -v starship; then
	curl -L https://github.com/starship/starship/releases/download/v1.14.2/starship-x86_64-unknown-linux-gnu.tar.gz --output starship.tar.gz
	tar -xf starship.tar.gz
	rm starship.tar.gz
	mv starship ~/bin
fi

echo "Installing vim plugins ..."
if [[ ! -d ~/.vim/pack/dist/start/vim-airline ]]; then
	git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
fi
if [[ ! -d ~/.vim/pack/dist/start/vim-airline-themes ]]; then
	git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes
fi
if [[ ! -d ~/.vim/pack/tpope/start/vim-sensible ]]; then
	git clone https://github.com/tpope/vim-sensible.git ~/.vim/pack/tpope/start/vim-sensible
fi
if [[ ! -f ~/.vim/colors/solarized.vim ]]; then
	mkdir -p ~/.vim/colors
	curl -L https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim --output ~/.vim/colors/solarized.vim
fi
