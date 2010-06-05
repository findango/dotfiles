# .bashrc
#
# Finlay Cannon <fin@finlaycannon.com>
#

# source the global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# path helper
function add_path() {
    export PATH=${PATH}:$1
}

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

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

# optional behaviour
export PAGER=less
export EDITOR=vi
export CLICOLOR=1 # color ls

# history settings
export HISTCONTROL=ignoredups  # don't put duplicate lines in the history
export HISTIGNORE="ls:ll:la:pwd:clear:h:j"
shopt -s histappend            # append to the history file rather than overwriting

# path
export JAVA_HOME=/Library/Java/Home
export ANT_HOME=/sw/lib/ant
export GROOVY_HOME=/Library/Groovy/Home
export CCL_DEFAULT_DIRECTORY=/Library/ccl/scripts

add_path "~/bin"
add_path "/usr/local/bin"
add_path "/opt/local/bin"
add_path "/usr/local/mysql/bin"
add_path "/System/Library/Frameworks/Python.framework/Versions/2.3/bin"
add_path "$GROOVY_HOME/bin"
add_path "/usr/local/git/bin"

# prompt
PS1="\[\033[0;32m\]\h:\W \$(parse_git_branch)\\$ \[\033[0m\]"

