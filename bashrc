#####################
#      ALIASES      #
#####################

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

#####################
#     FUNCTIONS     #
#####################

mcd () {
    mkdir $1
    cd $1
}

#####################

export HISTFILESIZE=27000
export HISTSIZE=270000
export NLTK_DATA=/data/nltk_data
export CONLL=/home/kxnguyen/coref/data/CoNLL_new
export PATH=$PATH:/home/khanhptnk/local/bin/:/usr/local/bin/
export LD_LIBRARY_PATH=/usr/local/lib
export THESIS=~/Code/thesis/
