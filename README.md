# Mirco's dotfiles

![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/200720-1338-26.png)
![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/200429-1554-00.png)

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

## Environment Stack

- dwm
- kitty
- zsh
- emacs (doom)

## Miscellaneous Software

- notifications: dunst
- pdf viewer: zathura
- file manager: ranger
- irc client: weechat

## Installation

```
$ ansible-playbook -K playbook.yml
```
