#!/bin/bash

function link() {
    ln -sv $PWD/$1 ~/.$1
}

link bash_profile
link bashrc
link gitconfig
link gitignore

source ~/.bash_profile
