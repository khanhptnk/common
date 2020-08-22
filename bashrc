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
force_color_prompt=yes

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

countsub() {
  find $1 -maxdepth 1 -mindepth 1 -type d -exec sh -c 'echo "{} : $(find "{}" -type f | wc -l)" file\(s\)' \;
}

countfile() {
  for filename in $@; do
    echo "$(wc -l $filename) file(s)"
  done
}


# ALIASES

alias ll="ls -lhA"
alias l="ls -CF"
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
alias wcl="wc -l"

alias gstat="git status -s"
alias gadd="git add"
alias gcom="git commit -m"
alias gpush="git push"
alias gpull="git pull"
alias gdiff="git diff"

alias rm="rm -rI"
alias python="python -u"

alias sshcontext="ssh kxnguyen@context.umiacs.umd.edu"
alias clipsub0="ssh kxnguyen@clipsub00.umiacs.umd.edu"
alias clipsub1="ssh kxnguyen@clipsub01.umiacs.umd.edu"

alias gputemp="watch -n1 nvidia-smi -q -d temperature"
alias chrismachine="ssh -i $HOME/Documents/ProductOfScotland/chrismachine.key chrisbkt@104.46.107.147"
alias chrismachine2="ssh -i /home/khanhptnk/Documents/ProductOfScotland/chrismachine.key chrisbkt@137.116.47.18"

export PATH=/home/khanhptnk/.linuxbrew/bin:/usr/local/cuda-9.1/bin:/home/khanhptnk/torch/install/bin:/home/khanhptnk/torch/install/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

export DYLD_LIBRARY_PATH=/home/khanhptnk/torch/install/lib:$DYLD_LIBRARY_PATH  # Added automatically by torch-dist

export CUDA_HOME=/usr/local/cuda-10.0
#export CUDA_HOME=/usr/local/cuda-9.0

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA_HOME/lib64"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"

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

export FALL2016=$HOME/Code/fall_2016
export NAMAS=$FALL2016/828z/NAMAS


# added by Anaconda2 4.3.1 installer
#export PATH="/home/khanhptnk/anaconda2/bin:$PATH"

. /home/khanhptnk/torch/install/bin/torch-activate

export EMNLP17_LOG=/home/khanhptnk/Code/pg-nmt/translate_log
export EMNLP17_DATA=/home/khanhptnk/Code/pg-nmt/data

# added by Anaconda3 4.4.0 installer
# export PATH="/home/khanhptnk/anaconda3/bin:$PATH"  # commented out by conda initialize

export siminterp_home=$HOME/Code/neural-simtrans
export siminterp_data=$siminterp_home/data
export siminterp_temp=$siminterp_home/log
export siminterp_save=$siminterp_home/log

export PATH=/home/khanhptnk/Code/neural-simtrans/tools/fast_align/build:$PATH

export GARGANTUA=$HOME/Code/Gargantua

# added by Anaconda2 installer
#export PATH="/home/khanhptnk/anaconda2/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/khanhptnk/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/khanhptnk/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/khanhptnk/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/khanhptnk/anaconda3/bin:$PATH"
    fi
fi
# unset __conda_setup
# <<< conda initialize <<<

