# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZDOTDIR=$HOME/.config/zsh

# --------- history cotrol ------------
# 不区分历史重复命令
HISTFILE=~/.zsh_history
setopt appendhistory
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "
# -------------------------------------
# emacs mode
# bindkey -e
# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
# zle_highlight=('paste:none')

#----------------
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"
# Normal files to source
zsh_add_file "zsh-exports"
# zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'fzf^M'
bindkey -s '^x' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
# bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^k" history-substring-search-down
bindkey "^j" history-substring-search-up
#
#
# ----- plugins ------

# plugins=(git colored-man-pages command-not-found git-extras)

# ----- END plugins configure ------

# source /Users/agou-ops/.config/zsh/antigen.zsh
# antigen use oh-my-zsh
# antigen bundle changyuheng/fz
# antigen bundle rupa/z
# antigen bundle agkozak/zsh-z
# antigen bundle zsh-users/zsh-completions
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle hcgraf/zsh-sudo
# antigen bundle b4b4r07/enhancd
#
# antigen apply

# ----- END antigen configure -----

#

alias ls="/usr/local/bin/colorls"
alias ll='ls -l --gs'
alias vim='nvim'
alias vimc='vim ~/.config/nvim/init.vim'
alias setproxy='export http_proxy=127.0.0.1:9870 && export https_proxy=127.0.0.1:9870'
alias unproxy='export http_proxy= && export https_proxy= '
# 手残有时候老是按错
alias s='ls'
alias la='ll -a'
alias sub='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias hy='nohup ~/PATH/hysteria client > ~/PATH/logs/hy.log 2>&1 &'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
# export CGO_CPPFLAGS="-Wno-error -Wno-nullability-completeness -Wno-expansion-to-defined -Wno-builtin-requires-header"
# export GOPATH="/opt/homebrew/Cellar/go/1.17.2"
# export GOBIN=$GOPATH/bin
# export PATH="/Users/agou-ops/PATH:/opt/homebrew/Cellar/go/1.17.2/bin:/opt/homebrew/opt/ruby/bin:/Library/Developer/CommandLineTools/usr/bin:/Users/agou-ops/Library/Python/3.8/bin:$PATH"
export LSP="/Users/agou-ops/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin"
export TABNINE=" ~/.vim/plugged/cmp-tabnine/binaries/4.4.6/aarch64-apple-darwin"
export PATH="/Users/agou-ops/PATH:/opt/homebrew/Cellar/go/1.17.2/bin:/opt/homebrew/opt/ruby/bin:/Users/agou-ops/Library/Python/3.8/bin:/Users/agou-ops/Library/Python/3.9/bin:$LSP:$TABNINE:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export TERM=xterm-256color
export ZSH_CUSTOM=~/.config/zsh
export EDITOR=nvim
#

# ----- vscode plugin ----
# git clone https://github.com/valentinocossar/vscode.git $ZSH_CUSTOM/plugins/vscode
source ~/.config/zsh/plugins/vscode/vscode.plugin.zsh

source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh

export PATH="/Users/agou-ops/go/bin:/opt/homebrew/opt/ruby/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
