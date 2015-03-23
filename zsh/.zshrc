# Use 'solarized' dircolors (https://github.com/seebi/dircolors-solarized.git)
eval `dircolors ~/.dircolors`

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="blinks"
ZSH_THEME="robbyrussell"

# aliases
alias vi="vim"
alias tmux="TERM=screen-256color-bce tmux"
alias wemux="TERM=screen-256color-bce wemux"
alias ack="ack-grep"
alias tmuxa='tmux attach -d -t'

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
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


ZSH_TMUX_FIXTERM_WITH_256COLOR="screen-256color"
ZSH_TMUX_FIXTERM_WITHOUT_256COLOR="screen-256color"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(heroku rails vi-mode)

source $ZSH/oh-my-zsh.sh

# teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

export EDITOR=/usr/bin/vim
export PATH=$HOME/bin:$HOME/local/bin:$HOME/.rbenv/bin:/usr/local/heroku/bin:$PATH

eval "$(rbenv init -)"
