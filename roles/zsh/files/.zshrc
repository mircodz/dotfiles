bindkey -e

source ~/.zsh/aliases
source ~/.zsh/exports
source ~/.zsh/mappings
source ~/.zsh/functions

# load fzf mappings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# press c-x-e to open comand line in the editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# fish like autocompletion
autoload history-search-end
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=history

source ~/.zsh/prompt
