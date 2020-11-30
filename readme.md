# Mirco's dotfiles

## Roles

### Editors

- [neovim](https://github.com/mircodezorzi/dotfiles/tree/master/roles/neovim)
- [doom](https://github.com/mircodezorzi/dotfiles/tree/master/roles/doom)
- [emacs](https://github.com/mircodezorzi/dotfiles/tree/master/roles/emacs)
- [vscode](https://github.com/mircodezorzi/dotfiles/tree/master/roles/vscode)

## Keyboard

If the key bindings might seem strange is because I use the
[Ergodox](https://www.ergodox.io/) keyboard with the
[Dvorak](https://www.dvorak-keyboard.com/) layout...

![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/keyboard-layout.png)

| layer  | modifier                |
|--------|-------------------------|
| top    | mod                     |
| center | mod + L2 (dvorak layer) |
| bottom | mod + shift             |

## Installation

```
$ ansible-playbook -K playbook.yml
```
