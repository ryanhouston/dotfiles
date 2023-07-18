# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="robbyrussell"

# aliases
#alias tmux="TERM=screen-256color-bce tmux"
alias wemux="TERM=screen-256color-bce wemux"
alias weather="curl wttr.in/'washington, dc'"
#alias open="xdg-open &>/dev/null"
[ -f /usr/local/bin/ctags ] && alias ctags=/usr/local/bin/ctags

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

ZSH_TMUX_FIXTERM_WITH_256COLOR="screen-256color"
ZSH_TMUX_FIXTERM_WITHOUT_256COLOR="screen-256color"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  colored-man-pages
  colorize
  docker
  docker-compose
  git
  github
  golang
  heroku
  httpie
#  rails
  rsync
  # tmux
  vi-mode
  z
  # zsh-autosuggestion
  zsh-syntax-highlighting
)

fpath=(~/.zsh-completions $fpath)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# Use ESC-v to edit command in $EDITOR
bindkey -M vicmd v edit-command-line


# Add timestamp to right end of prompt
PROMPT="%{$fg_bold[yellow]%}%* $PROMPT "

# teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

export EDITOR=`which nvim`
export PATH=$HOME/bin:$HOME/local/bin:$HOME/.rbenv/bin:/usr/local/heroku/bin:$PATH

export PATH=$HOME/.local/bin:$PATH

# Include local project node_module bin in PATH
export PATH=./node_modules/.bin:$PATH

# Ruby
command -v rbenv > /dev/null && eval "$(rbenv init -)"
RI='--format=ansi'

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go lang
export GOPATH=$HOME/Projects/go
command -v go > /dev/null && export PATH=$PATH:$(go env GOPATH)/bin

# added by travis gem
[ -f /home/rouston/.travis/travis.sh ] && source /home/rouston/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z plugin to jump to commonly used dirs
# https://github.com/rupa/z
[ -f ~/Projects/z/z.sh ] && source ~/Projects/z/z.sh

# arduino
export ARDUINO_PATH=/usr/local/arduino

# compass env
[ -f ~/.compassrc ] && [ -d $HOME/development/urbancompass ] && source ~/.compassrc

# store secret API tokens and such in ~/.localrc to keep it out of the git repo
[ -f ~/.localrc ] && source ~/.localrc
export PATH="/usr/local/sbin:$PATH"
