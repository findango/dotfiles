#!/usr/bin/env bash

dir=$PWD
if [[ ! "$dir/install.sh" -ef "$0" ]]; then
    echo "You should run install.sh from the dotfiles root folder."
    exit 1
fi

function link {
    source=$dir/$1
    dotfile=$HOME/.$1
    
    # if file exists and isn't a symlink, skip it 
    if [ -e "${dotfile}" -a ! -h "${dotfile}" ]; then
        echo "${dotfile} already exists... skipping."
    else
        ln -sfv ${source} ${dotfile}
    fi
}

echo "Linking..."
link bash_profile
link bashrc
link gitconfig
link gitignore
link inputrc
link jshintrc
link npmrc
link vimrc
echo

echo "Reloading bash profile..."
source $HOME/.bash_profile

echo "Done."
