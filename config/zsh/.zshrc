path=(
  $HOME/bin
  $HOME/.cargo/bin
  $GOPATH/bin
  $XDG_CONFIG_HOME/tmux/
  $path
  $HOME/.anyenv/bin
  $HOME/src/github.com/himanoa/git-subcommands/src
)
fpath+=$HOME/.zsh/pure
export FZF_TMUX=1
export EDITOR='nvim'
autoload -U compinit
compinit -u

unsetopt prompt_subst;

bindkey -d
bindkey -e
alias vim='nvim'
alias buraro='git status -s | awk "{print $2}" | xargs rm -rf'

function ghq_cd() {
  cd $(ghq root)/$(ghq list | fzf-tmux)
}

function gst() {
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        git status -sb
    fi
}
autoload -z edit-command-line
zle -N ghq_cd ghq_cd
zle -N edit-command-line
bindkey "^X^E" ghq_cd
fpath=(/usr/local/share/zsh-completions ${fpath})
autoload -U promptinit; promptinit
prompt pure

function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}

eval "$(anyenv init -)"
eval "$(direnv hook zsh)"
eval $(opam env)


source ~/.config/zsh/antigen/bin/antigen.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle from"gh-r" as"program"
antigen bundle chitoku-k/fzf-zsh-completions
antigen apply
