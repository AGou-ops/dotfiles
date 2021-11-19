# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----- END p10k configure -----

# --------- history cotrol ------------
# 不区分历史重复命令
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "
# -------------------------------------
#
# ----- plugins ------

plugins=(git )

# ----- END plugins configure ------

source /Users/agou-ops/.config/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle changyuheng/fz
antigen bundle rupa/z
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle hcgraf/zsh-sudo



antigen apply

# ----- END antigen configure -----

# 

alias ls='colorls'
alias ll='ls -l --gs'
alias vim='nvim'
alias setproxy='export http_proxy=127.0.0.1:9870 && export https_proxy=127.0.0.1:9870'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export TERM=xterm-256color
export ZSH_CUSTOM=~/.config/zsh
# export EDITOR=vim

# -----
#
# source ~/.config/zsh/zsh-z.plugin.zsh
# 
# autoload -U compinit && compinit
# 
# zstyle ':completion:*' menu select
# 
zstyle ':completion:*' menu select
# ----- END z plugin ----

bindkey -e

# ----- vscode plugin ----
# git clone https://github.com/valentinocossar/vscode.git $ZSH_CUSTOM/plugins/vscode
source ~/.config/zsh/plugins/vscode/vscode.plugin.zsh
# ----- zsh syntax highlighting -----
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ----- zsh history substring search ----
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# ----------------------------------------
