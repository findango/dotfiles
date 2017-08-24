# .bashrc
#
# Finlay Cannon <fin@finlaycannon.com>
#

# source the global defs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# aliases
alias rm='rm -i'
alias mv='mv -i'
alias md='mkdir -p'
alias h='history 25'
alias j='jobs -l'
alias ll='ls -oh'
alias la='ls -oah'
alias df='df -h'
alias cls=clear

# typos
alias cd..='cd ..'
alias :q='exit'  # habits are hard to break
alias yar=yarn

# helpers
alias cpwd='pwd | xargs echo-n | pbcopy'
alias reload='. ~/.bash_profile'
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias finder='open -a finder `pwd`'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
alias copy='pbcopy'
alias paste='pbpaste'

# hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# folders
alias ..='cd ..'
alias ....='cd ../..'
alias proj='cd ~/Projects'
alias drop='cd ~/Dropbox'

# optional behaviour
export PAGER=less
export MANPAGER='less -F'
export EDITOR=vi
export CLICOLOR=1 # color ls

# history settings
export HISTCONTROL=ignoredups  # don't put duplicate lines in the history
export HISTIGNORE="ls:ll:la:pwd:clear:h:history:j:* --help"  # ignore common minor commands
shopt -s histappend  # append to the history file rather than overwriting

# Check the window size after each command, update LINES and COLUMNS
shopt -s checkwinsize

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# delete if you already modified MANPATH elsewhere in your config
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# path
export JAVA_HOME=/Library/Java/Home
export ANT_HOME=/sw/lib/ant
export CCL_DEFAULT_DIRECTORY=/Library/ccl/scripts

export PATH=\
~/bin:\
/usr/local/bin:\
/opt/local/bin:\
/usr/local/mysql/bin:\
/System/Library/Frameworks/Python.framework/Versions/2.3/bin:\
/usr/local/git/bin:\
$PATH


# fancy git prompts
function git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

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

    export PS1="$GREEN\w $GREENBOLD\$(git_branch)$GREEN\n\\$ $NORMAL"
}
prompt

# source any machine local defs
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
