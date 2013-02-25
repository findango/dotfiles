# .bashrc
#
# Finlay Cannon <fin@finlaycannon.com>
#

# source the global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# fancy git prompts
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# aliases
alias ..='cd ..'
alias :q='exit'  # habits are hard to break
alias rm='rm -i'
alias mv='mv -i'
alias md='mkdir -p'
alias h='history 25'
alias j='jobs -l'
alias ll='ls -lh'
alias la='ls -lah'
alias cpwd='pwd | xargs echo-n | pbcopy'
alias reload='. ~/.bash_profile'
alias df='df -h'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias cls=clear
alias finder='open -a finder `pwd`'

# hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# optional behaviour
export PAGER=less
export MANPAGER='less -F'
export EDITOR=vi
export CLICOLOR=1 # color ls

# history settings
export HISTCONTROL=ignoredups  # don't put duplicate lines in the history
export HISTIGNORE="ls:ll:la:pwd:clear:h:j:* --help"
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

function prompt {
    # see http://blog.bigdinosaur.org/easy-ps1-colors/
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    local NORMAL="\[\033[00m\]"

    #export PS1="\n$BLACKBOLD[\t]$GREENBOLD \u@\h\[\033[00m\]:$BLUEBOLD\w\[\033[00m\] \\$ "
    export PS1="\[\033[0;32m\]\h:\W \$(parse_git_branch)\\$ \[\033[0m\]"
}
prompt

