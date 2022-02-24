source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit
compinit

# Kubectl autocompletion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
compdef k='kubectl'

# Kubectl autocompletion
[[ $commands[helm] ]] && source <(helm completion zsh)

# Docker autocompletion
source "$HOME/.zsh/_docker"

# Syntax Highligthing
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice lucid wait='0' atload='_zsh_autosuggest_start'

# Completion
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/history-search-multi-word

# fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

bindkey -e

source ~/.zsh/prompt
source ~/.zsh/aliases
source ~/.zsh/exports
source ~/.zsh/mappings

# press c-x-e to open comand line in the editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
