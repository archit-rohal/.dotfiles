# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=/usr/local/bin/nvim

#To make mpv work when 'lf' is launched with 'sudo' (also added similar thing to sudoers)-
export PULSE_SERVER="/run/user/$(id -u)/pulse/native"

#export DISPLAY=:0
export BAT_THEME='gruvbox-dark'

#Relate to zoxide (refer arch wiki)
#export _ZO_ECHO=1
export _ZO_MAXAGE=50000 

export NSXIV_OPTS="-aq"

export PATH=$PATH:$HOME/node-v20.10.0-linux-x64/bin
export PATH=$PATH:$HOME/.npm-global/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

#Curated nice omz themes to choose -  dogenpunk, kafeitu, linuxonly, gentoo, jonathan, sunaku, jreese, duellj, junkfood, example, gnzh, bira, funky, refined, crunch

HISTSIZE=200000
SAVEHIST=200000
HISTFILE=~/.zsh_history

setopt histignorealldups sharehistory
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.


#Use modern completion system
#autoload -Uz compinit
#compinit

export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --scrollbar --cycle --color scrollbar:red'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( 
	  git 
	  copypath
	  copyfile
	  copybuffer
	  colored-man-pages
	  command-not-found
	  zoxide
      emotty
      fzf
	  zsh-autosuggestions
	  zsh-syntax-highlighting
	 )

export FZF_BASE=/usr/bin/fzf

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh_aliases


# vi mode
bindkey -v
export KEYTIMEOUT=1

#vi-mode related - 
#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true;
#VI_MODE_SET_CURSOR=true;

bindkey '^[h' autosuggest-accept
bindkey '^[H' autosuggest-execute
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

source /home/mark/.oh-my-zsh/custom/plugins/fzf-tab-completion.sh
bindkey '^I' fzf_completion

 lf() {
     tmp=$(mktemp)
     /home/mark/.config/lf/lfcd.sh -last-dir-path="$tmp" "$@"
     [ -f "$tmp" ] && dir=$(cat "$tmp") && rm -f "$tmp" && [ -d "$dir" ] && cd "$dir"
 }

lfs() {
    tmp="/tmp/lfdir_$USER"
    sudo /home/mark/.config/lf/lfcd.sh -last-dir-path="$tmp" "$@"
    sudo chown $USER:$USER "$tmp" 2>/dev/null  # Change ownership to 'mark'
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"  # Now 'mark' can remove the file without permission issues
        cd "$dir" || return
    fi
}

# sudo() {
#   if [[ $1 == "mpv" ]]; then
#     command sudo -E mpv "${@:2}"
#   else
#     command sudo "$@"
#   fi
# }


fzf-cd-widget() {
  local dir=$(find ${HOME} -type d 2> /dev/null | fzf +m)
  [[ -d $dir ]] && cd "$dir"
  zle reset-prompt
}
zle -N fzf-cd-widget
bindkey '^[f' fzf-cd-widget

function define() {
  tmpfile=$(mktemp)
  nohup sh -c "dict $1 > $tmpfile && st -e less $tmpfile" > /dev/null 2>&1 &
  disown
}

alias dict='dict "$@" | less'

source /home/mark/.config/broot/launcher/bash/br

# Created by `pipx` on 2024-01-31 21:11:15
export PATH="$PATH:/home/mark/.local/bin"
