
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

alias ll='ls -l'
alias findi='find . | grep -i '
alias findebooks='find ~/Ebooks* | grep -i '
alias du1='du -h -d 1 '
alias dubig='du -h -d 1 -I Library | egrep "[0-9]{3}M|[0-9]G"'

alias sshnuc3="ssh \$NUC3USER@\$NUC3IPADDRESS"
alias sshfsnuc3="sshfs \$NUC3USER@\$NUC3IPADDRESS:/home/\$NUC3USER ~/mnt/nuc3"
alias umountnuc3='umount ~/mnt/nuc3'
alias lite="/Applications/Lite\ XL.app/Contents/MacOS/lite-xl"
alias activate='source venv/bin/activate'
# https://stackoverflow.com/questions/18215389/how-do-i-measure-request-and-response-times-at-once-using-curl
alias curltime="curl -w \"@$HOME/.curl/time-format.txt\" "

if [ -f ~/.aliases ] ; then
    source ~/.aliases
fi

# Rbenv
eval "$(rbenv init - zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# Put brew curl before macos curl
# export PATH="/opt/homebrew/opt/curl/bin:$PATH"
