export GIT_PS1_SHOWDIRTYSTATE=
export GIT_PS1_SHOWSTASHSTATE=
export GIT_PS1_SHOWUNTRACKEDFILES=
export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
export PROMPT_COMMAND='__git_ps1 "\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]" " \\\$ "'
export PATH=$PATH:~/go/bin



__fzf_git__() {
    local gitcmd="git branch --all | grep -v HEAD"
    local cmd="${gitcmd:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
    eval "$gitcmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
    printf '%q ' "$item"
  done
  echo
}

bind '"\eb": " \C-u \C-a\C-k`__fzf_git__`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'

