# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=270000
HISTFILESIZE=27000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ALIASES

alias ll="ls -lhA"
alias ls="ls -CF"
alias lll="ls -lhFA | less"
alias ..="cd .."
alias openbash="vim ~/.bashrc"
alias savebash="source ~/.bashrc"
alias fname="find . -name "
alias df="df -h"
alias free="free -mt"
alias ps="ps auxf | less"
alias makenote="cp ~/Code/note.tex ."
alias opennote="vim ~/Code/note.tex"
alias countblank="grep -cvP '\S'"
alias gstat="git status -s"
alias gadd="git add"
alias gcom="git commit -m"
alias gpush="git push"
alias gdiff="git diff"
alias gpull="git pull"
alias rm="rm -rfI"
alias sshcontext="ssh kxnguyen@context.umiacs.umd.edu"


synclient AreaLeftEdge=1500
synclient AreaRightEdge=5000

TOUCHPAD_ID=`xinput | grep TouchPad | cut -f2 | cut -d'=' -f2`
xinput --set-prop $TOUCHPAD_ID "Synaptics Finger" 30 50 150


export PATH=/home/khanhptnk/.linuxbrew/bin:/usr/local/cuda-7.0/bin:/home/khanhptnk/torch/install/bin:/home/khanhptnk/torch/install/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

export LD_LIBRARY_PATH=/home/khanhptnk/torch/install/lib:$LD_LIBRARY_PATH  # Added automatically by torch-dist
export DYLD_LIBRARY_PATH=/home/khanhptnk/torch/install/lib:$DYLD_LIBRARY_PATH  # Added automatically by torch-dist


export CUDA_HOME=/usr/local/cuda 
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$CUDA_HOME/lib 
 
export MANPATH=/home/khanhptnk/.linuxbrew/share/man
export INFOPATH=/home/khanhptnk/.linuxbrew/share/info

export IWSLT2015="$HOME/Code/iwslt_2015"

#export PYTHONPATH=/usr/lib/python2.7:/usr/lib/python2.7/plat-x86_64-linux-gnu:/usr/lib/python2.7/lib-tk:/usr/lib/python2.7/lib-old:/usr/lib/python2.7/lib-dynload:/home/khanhptnk/.local/lib/python2.7/site-packages:/usr/local/lib/python2.7/dist-packages:/usr/lib/python2.7/dist-packages:/usr/lib/python2.7/dist-packages/PILcompat:/usr/lib/python2.7/dist-packages/gtk-2.0:/usr/lib/pymodules/python2.7:/usr/lib/python2.7/dist-packages/ubuntu-sso-client:$HOME/Code/vowpal_wabbit/python

export BOILER_HOME=$HOME/Code/boilerpipe-1.2.0
export CLASSPATH=/home/khanhptnk/Code/boilerpipe-1.2.0/lib/nekohtml-1.9.13.jar:/home/khanhptnk/Code/boilerpipe-1.2.0/lib/xerces-2.9.1.jar
export KENLM_HOME=$HOME/Code/kenlm/
export TSF_HOME=$HOME/Code/tensorflow/tensorflow
export WAREHOUSE=$HOME/Code/warehouse
export EMBEDDINGS=$WAREHOUSE/embeddings

export TWEET_TAGGER=$HOME/Code/ark-tweet-nlp-0.3.2
export TWEET_DEP_PARSER=$HOME/Code/TweeboParser
export CRF_SUITE=$HOME/Code/crfsuite-0.12/bin
export MALLET=$HOME/Code/mallet-2.0.8RC3


# added by Anaconda2 4.3.0 installer
#export PATH="/home/khanhptnk/anaconda2/bin:$PATH"

export MOSES=$HOME/Code/mosesdecoder/scripts

# added by Anaconda3 installer
export PATH="/home/khanhptnk/anaconda3/bin:$PATH"

export GARGANTUA=$HOME/Code/Gargantua

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
