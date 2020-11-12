# Mirco's dotfiles

![](https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/200429-1554-00.png)

## Roles

### Editors

<details>
<summary><a href="https://github.com/mircodezorzi/dotfiles/tree/master/roles/neovim/files/.config/nvim">Neovim configuration</a></summary>
<img src="https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/screenshots/201102-1316-22.png"/>
</details>

<details>
<summary><a href="https://github.com/mircodezorzi/dotfiles/tree/master/roles/doom/files/.doom.d">Doom Emacs configuration</a></summary>
<img src="https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/screenshots/201102-1315-24.png"/>
</details>

<details>
<summary><a href="https://github.com/mircodezorzi/dotfiles/tree/master/roles/emacs/files/.emacs.d">Vanilla Emacs configuration</a></summary>
<img src="https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/screenshots/201102-1200-31.png"/>
</details>

<details>
<summary><a href="https://github.com/mircodezorzi/dotfiles/tree/master/roles/vscode/files/.config/Code - Insiders/User">Visual Studio Code configuration</a></summary>
<img src="https://raw.githubusercontent.com/mircodezorzi/dotfiles/master/screenshots/201102-1319-54.png"/>
</details>

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
