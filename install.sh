#!/bin/bash

function link() {
    source=$PWD/$1
    dotfile=~/.$1
    
    # if file exists and isn't a symlink, skip it 
    if [ -e "${dotfile}" -a ! -h "${dotfile}" ]; then
        echo "${dotfile} already exists"
    else
        ln -sfv ${source} ${dotfile}
    fi
}

link bash_profile
link bashrc
link gitconfig
link gitignore

source ~/.bash_profile
