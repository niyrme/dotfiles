if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='ls -l'
alias lg='lazygit'
alias gs='git status'
alias pca='pre-commit run -a'
alias py='/usr/bin/env python3'
alias pypip='/usr/bin/env python3 -m pip'
