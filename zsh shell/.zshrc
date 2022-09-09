# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------------------------------------------------------------------
# -------------------- Remapping settings --------------------
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey -s '^f' 'fzf^M'
bindkey -s '^o' 'ranger^M'
bindkey -s '^s' 'ncdu^M'
# -------------------- zstyle settings --------------------
autoload -U compinit; compinit

setopt NO_GLOBAL_RCS
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "/tmp/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# -------------------- Alias settings --------------------
alias proxy="http_proxy=127.0.0.1:1081 https_proxy=127.0.0.1:1081 all_proxy=socks5://127.0.0.1:1080 "

alias rm='echo -e "\n\e[1;41mPlease donnot fucking use rm command.(use transh FILES instead)\e[0m\n\nUsage:\n\ntrash-put[tp]           trash files and directories.\ntrash-empty[te]         empty the trashcan(s).\ntrash-list[tl]          list trashed files.\ntrash-restore[tr]       restore a trashed file.\ntrash-rm[trm]           remove individual files from the trashcan." && false'
alias tp='trash-put'
alias te='trash-empty'
alias tl='trash-list'
alias tr='trash-restore'
alias trm='trash-rm'

alias ls="/usr/local/bin/colorls"
alias lls='/bin/ls'
alias ll='ls -l --gs'
alias ..='cd ../'
alias ../='cd ../'
alias ../../='cd ../../'
alias ../..='cd ../../'
alias ../../../='cd ../../../'
alias ../../..='cd ../../../'
alias vim='nvim'
alias vvim='nvim -u NONE'
alias vi='vvim'
alias vimc='proxy vim ~/.config/nvim/init.vim'
alias setproxy='export http_proxy=127.0.0.1:1081 && export https_proxy=127.0.0.1:1081 && export all_proxy=socks5://127.0.0.1:1080 '
alias unproxy='export http_proxy= && export https_proxy= '
# 手残有时候老是按错
alias s='ls'
alias la='ll -a'
alias sub='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias hy='nohup ~/PATH/hysteria client > ~/PATH/logs/hy.log 2>&1 &'
alias hysteria='nohup ~/PATH/hysteria client > ~/PATH/logs/hy.log 2>&1 &; nohup ~/PATH/hysteria-tun-darwin-10.12-arm64 client -c ./vir_config.json > /dev/null 2>&1 &'
alias cat='bat'
alias chrome='open -a "Google Chrome"'

alias resume='miktex-xelatex resume_photo.tex && chrome resume_photo.pdf'

# tmp alias
alias cka='ssh candidate@192.168.0.104 -p 9999'
alias cka_remote='ssh candidate@23.94.56.169 -p 9999'

alias greenlight='pgcli "postgres://postgres:123@localhost?sslmode=disable"'


alias ping='pingu'


# -------------------- PATH settings --------------------
export LUALSP="/Users/agou-ops/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin"
export MASON_PATH="/Users/agou-ops/.local/share/nvim/lsp_servers/bin/"
export TABNINE=" ~/.vim/plugged/cmp-tabnine/binaries/4.4.6/aarch64-apple-darwin"
export PSQL="/Library/PostgreSQL/14/bin"
export PYTHON="~/Library/Python/3.9/bin"
export PATH="/Users/agou-ops/PATH/bin/:/Users/agou-ops/PATH:/opt/homebrew/opt/ruby/bin:/Users/agou-ops/Library/Python/3.9/bin:/opt/homebrew/lib/ruby/gems/3.1.0/bin:$LUALSP:$TABNINE:$PATH:$MASON_PATH:$PSQL:$PYTHON"

# read man pages use neovim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export EDITOR='vim -u NONE'


# -------------------- Source settings --------------------

# -------------- Themes --------------
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# -------------- Plugins --------------
source ~/.config/zsh/plugins/zsh-autosuggestion/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-z.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)
source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh


# -------------------- Other settings --------------------
export TERM=xterm-256color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls="/usr/local/bin/colorls"

eval $(thefuck --alias)

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
(( ! ${+functions[p10k]} )) || p10k finalize

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
