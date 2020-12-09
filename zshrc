# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/josh/.oh-my-zsh"

# Load zsh plugins
# plugins=(git)

# source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/josh/.zshrc'

# compinit is the directory completion system
autoload -Uz compinit
compinit
# End of lines added by compinstall

alias battery='acpi'
alias soundmix='alsamixer'
alias show-wifi='nmcli device wifi list'
alias wifi-status='nmcli connection'
alias weather='curl wttr.in'
# nmcli device wifi connect 'SSID' password 'password'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
