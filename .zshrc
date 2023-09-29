alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b)'
prompt='%~${vcs_info_msg_0_} %# '

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
