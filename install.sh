#!/bin/bash

function link() {
    ln -fsv $PWD/$1 ~/.$1
}

link bash_profile
link bashrc
link gitconfig
link gitignore

source ~/.bash_profile
