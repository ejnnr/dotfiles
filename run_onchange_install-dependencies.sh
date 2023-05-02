#!/bin/bash

set -eo pipefail

mkdir -p ~/.local/bin

# Install bat
if ! command -v bat &> /dev/null; then
	curl https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-v0.23.0-x86_64-unknown-linux-gnu.tar.gz --output bat.tar.gz
	tar -xf bat.tar.gz
	rm bat.tar.gz
	mv bat-v0.23.0-x86_64-unknown-linux-gnu/bat ~/.local/bin
fi


# Install exa
if ! command -v exa &> /dev/null; then
	curl https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip --output exa.tar.gz
	tar -xf bat.tar.gz
	rm exa.tar.gz
	mv exa-linux-x86_64-v0.10.1/bin/exa ~/.local/bin
fi

# Install starship prompt
if ! command -v starship; then
	curl -sS https://starship.rs/install.sh | sh
fi

# Install vim plugins
if [[ ! -d ~/.vim/pack/dist/start/vim-airline ]]; then
	git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
fi
if [[ ! -d ~/.vim/pack/dist/start/vim-airline-themes ]]; then
	git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes
fi
if [[ ! -d ~/.vim/pack/tpope/start/vim-sensible ]]; then
	git clone https://github.com/tpope/vim-sensible.git ~/.vim/pack/tpope/start/vim-sensible
fi
