zimfw() { source /Users/agou-ops/.zim/zimfw.zsh "${@}" }
zmodule() { source /Users/agou-ops/.zim/zimfw.zsh "${@}" }
typeset -g _zim_fpath=(/Users/agou-ops/.zim/modules/git/functions /Users/agou-ops/.zim/modules/utility/functions /Users/agou-ops/.zim/modules/duration-info/functions /Users/agou-ops/.zim/modules/git-info/functions /Users/agou-ops/.zim/modules/zsh-completions/src /Users/agou-ops/.zim/modules/git/functions /Users/agou-ops/.zim/modules/utility/functions /Users/agou-ops/.zim/modules/duration-info/functions /Users/agou-ops/.zim/modules/git-info/functions /Users/agou-ops/.zim/modules/zsh-completions/src)
fpath=(${_zim_fpath} ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info
source /Users/agou-ops/.zim/modules/powerlevel10k/powerlevel10k.zsh-theme
source /Users/agou-ops/.zim/modules/zsh-autopair/autopair.zsh
source /Users/agou-ops/.zim/modules/zsh-z-plugin/zsh-z.plugin.zsh
source /Users/agou-ops/.zim/modules/environment/init.zsh
source /Users/agou-ops/.zim/modules/git/init.zsh
source /Users/agou-ops/.zim/modules/input/init.zsh
source /Users/agou-ops/.zim/modules/termtitle/init.zsh
source /Users/agou-ops/.zim/modules/utility/init.zsh
source /Users/agou-ops/.zim/modules/duration-info/init.zsh
source /Users/agou-ops/.zim/modules/asciiship/asciiship.zsh-theme
source /Users/agou-ops/.zim/modules/completion/init.zsh
source /Users/agou-ops/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/agou-ops/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/agou-ops/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/agou-ops/.zim/modules/environment/init.zsh
source /Users/agou-ops/.zim/modules/git/init.zsh
source /Users/agou-ops/.zim/modules/input/init.zsh
source /Users/agou-ops/.zim/modules/termtitle/init.zsh
source /Users/agou-ops/.zim/modules/utility/init.zsh
source /Users/agou-ops/.zim/modules/duration-info/init.zsh
source /Users/agou-ops/.zim/modules/asciiship/asciiship.zsh-theme
source /Users/agou-ops/.zim/modules/completion/init.zsh
source /Users/agou-ops/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/agou-ops/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/agou-ops/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
