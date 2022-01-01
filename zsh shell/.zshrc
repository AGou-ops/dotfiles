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

plugins=(git colored-man-pages command-not-found git-extras zsh-autosuggestions)

# ----- END plugins configure ------

source /Users/agou-ops/.config/zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle changyuheng/fz
antigen bundle rupa/z
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hcgraf/zsh-sudo
antigen bundle b4b4r07/enhancd



antigen apply

# ----- END antigen configure -----

# 

alias ls='colorls'
alias ll='ls -l --gs'
alias vim='nvim'
alias setproxy='export http_proxy=127.0.0.1:9870 && export https_proxy=127.0.0.1:9870'
alias unproxy='export http_proxy= && export https_proxy= '
# 手残有时候老是按错
alias s='ls'
alias la='ll -a'
alias sub='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
# export CGO_CPPFLAGS="-Wno-error -Wno-nullability-completeness -Wno-expansion-to-defined -Wno-builtin-requires-header"
# export GOPATH="/opt/homebrew/Cellar/go/1.17.2"
# export GOBIN=$GOPATH/bin
export PATH="/Users/agou-ops/PATH:/opt/homebrew/Cellar/go/1.17.2/bin:/opt/homebrew/opt/ruby/bin:/Library/Developer/CommandLineTools/usr/bin:/Users/agou-ops/Library/Python/3.8/bin:$PATH"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export TERM=xterm-256color
export ZSH_CUSTOM=~/.config/zsh
# export EDITOR=vim
#

#----------------
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=254,bg=#808080,italic,underline"
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#-----------------


# -----
#
# source ~/.config/zsh/zsh-z.plugin.zsh
# 
# autoload -U compinit && compinit
# 
# zstyle ':completion:*' menu select
# 
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit
# ----- END z plugin ----

bindkey -e

# ----- vscode plugin ----
# git clone https://github.com/valentinocossar/vscode.git $ZSH_CUSTOM/plugins/vscode
source ~/.config/zsh/plugins/vscode/vscode.plugin.zsh
# ----- zsh syntax highlighting -----
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# spack env
source ~/GitHub_workspace/spack/share/spack/setup-env.sh

# ----- zsh history substring search ----
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# -------- thefuck -----------
eval $(thefuck --alias)
# --------------PATH--------------------------
export LUA_LSP="~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/"
export PATH="$LUA_LSP:/Users/agou-ops/go/bin:/opt/homebrew/opt/ruby/bin:$PATH"



