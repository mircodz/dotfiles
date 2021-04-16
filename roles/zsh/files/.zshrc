source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

fpath+=$HOME/.zsh/pure

# Theme, currently not working
#zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
#zinit light sindresorhus/pure

# Syntax Highligthing
zinit light zdharma/fast-syntax-highlighting
zinit ice lucid wait='0' atload='_zsh_autosuggest_start'

# Completion
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/history-search-multi-word

# fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

autoload colors; colors

autoload -U promptinit; promptinit; prompt pure

bindkey -e

source ~/.zsh/prompt
source ~/.zsh/aliases
source ~/.zsh/exports
source ~/.zsh/mappings
source ~/.zsh/functions

# press c-x-e to open comand line in the editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
