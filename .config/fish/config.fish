bass source ~/.bashrc

set fish_greeting 

alias docker "sudo docker"
alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

set -g FZF_CTRL_T_COMMAND "find \$dir -not \( -path '*/node_modules' -prune \) \
  -not \( -path '*/.git' -prune \) \
  2> /dev/null"

fish_vi_key_bindings

