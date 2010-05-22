# bashrc
#
# Finlay Cannon <fin@finlaycannon.com>
#


# source the global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# color ls
export CLICOLOR=1

# aliases
alias rm='rm -i'
alias mv='mv -i'
alias h='history 25'
alias j='jobs -l'
alias ll='ls -l'
alias la='ls -la'
alias cpwd='pwd | xargs echo-n | pbcopy'
alias reload='. ~/.bash_profile'
alias df='df -h'

# exports
export PAGER=less
export EDITOR=vi
# don't put duplicate lines in the history
export HISTCONTROL=ignoredups

# path
export JAVA_HOME=/Library/Java/Home
export ANT_HOME=/sw/lib/ant
export GROOVY_HOME=/Library/Groovy/Home

export CCL_DEFAULT_DIRECTORY=/Library/ccl/scripts

export PATH=~/bin:/usr/local/bin:/opt/local/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/System/Library/Frameworks/Python.framework/Versions/2.3/bin
export PATH=$PATH:$GROOVY_HOME/bin
export PATH=$PATH:/usr/local/git/bin

# prompt
PS1="\[\033[0;32m\]\h:\W\\$ \[\033[0m\]"

