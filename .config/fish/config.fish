set -x PATH $HOME/.cargo/bin $PATH
set -gx GPG_TTY (tty)

set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin:$GOROOT/bin:$PATH
set -x PATH /home/niyrme/.local/bin:$PATH
