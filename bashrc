# .bashrc
#
# Finlay Cannon <fin@finlaycannon.com>
#

# source the global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

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
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias cls=clear

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

export PATH=$PATH:\
~/bin:\
/usr/local/bin:\
/opt/local/bin:\
/usr/local/mysql/bin:\
/System/Library/Frameworks/Python.framework/Versions/2.3/bin:\
$GROOVY_HOME/bin:\
/usr/local/git/bin


# prompt
PS1="\[\033[0;32m\]\h:\W \$(parse_git_branch)\\$ \[\033[0m\]"

