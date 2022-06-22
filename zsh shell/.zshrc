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
bindkey -s '^f' 'fzf^M'
bindkey -s '^o' 'ranger^M'
bindkey -s '^s' 'ncdu^M'

# -------------------- Alias settings --------------------
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
alias cat='bat'
alias chrome='open -a "Google Chrome"'


# -------------------- PATH settings --------------------
export LUALSP="/Users/agou-ops/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin"
export TABNINE=" ~/.vim/plugged/cmp-tabnine/binaries/4.4.6/aarch64-apple-darwin"
export PATH="/Users/agou-ops/PATH/bin/:/Users/agou-ops/PATH:/opt/homebrew/Cellar/go/1.17.2/bin:/opt/homebrew/opt/ruby/bin:/Users/agou-ops/Library/Python/3.8/bin:/Users/agou-ops/Library/Python/3.9/bin:$LUALSP:$TABNINE:$PATH"


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
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

(( ! ${+functions[p10k]} )) || p10k finalize
alias ls="/usr/local/bin/colorls"

(( ! ${+functions[p10k]} )) || p10k finalize

eval $(thefuck --alias)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
