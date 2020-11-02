# Mirco's dotfiles

![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/200429-1554-00.png)

## Roles

### Editors

neovim: Neovim configuration
![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/201102-1316-22.png)

doom: Doom Emacs configuration
![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/201102-1315-24.png)

emacs: Vanilla Emacs configuration
![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/201102-1200-31.png)

code: Visual Studio Code configuration
![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/201102-1319-54.png)

## Keyboard

If the key bindings might seem strange is because I use the
[Ergodox](https://www.ergodox.io/) keyboard with the
[Dvorak](https://www.dvorak-keyboard.com/) layout...

![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/keyboard-layout.png)

| layer  | modifier                |
|--------|-------------------------|
| top    | mod                     |
| center | mod + shift             |
| bottom | mod + L2 (dvorak layer) |

## Miscellaneous Software

- notifications: dunst
- pdf viewer: zathura
- file manager: ranger
- irc client: weechat

## Installation

```
$ ansible-playbook -K playbook.yml
```
