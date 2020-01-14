;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Mirco De Zorzi"
      user-mail-address "mircodezorzi@protonmail.com")

(setq doom-font (font-spec :family "Source Code Pro" :size 20))

(setq doom-theme 'base16-default-dark)

(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

(map! :nvm (kbd "C-p") #'counsel-fzf)

(map! :nvm "s" #'evil-ex)

(map!
 :after org
 :map evil-org-mode-map
 :nvm "d" #'evil-backward-char)

(map! :nvm "d" #'evil-backward-char)
(map! :nvm "n" #'evil-forward-char)
(map! :nvm "h" #'evil-next-line)
(map! :nvm "t" #'evil-previous-line)

(map! :nvm "D" #'evil-beginning-of-line)
(map! :nvm "N" #'evil-end-of-line)
(map! :nvm "H" #'(lambda () (interactive) (evil-next-line 5)))
(map! :nvm "T" #'(lambda () (interactive) (evil-previous-line 5)))

(map! :nvm "j" #'evil-delete)
(map! :nvm "k" #'evil-find-char-to)

(map! :nvm (kbd "C-d") #'evil-window-left)
(map! :nvm (kbd "C-h") #'evil-window-down)
(map! :nvm (kbd "C-t") #'evil-window-up)
(map! :nvm (kbd "C-n") #'evil-window-right)

(after! evil-snipe
  (evil-snipe-mode -1))

(setq key-chord-two-keys-delay 0.05)
(key-chord-define evil-insert-state-map "eu" 'evil-normal-state)
(key-chord-mode 1)

(add-to-list 'custom-theme-load-path "~/code/base16-emacs/build")
(add-to-list 'load-path "~/code/base16-emacs")

(evil-mode t)

(global-evil-leader-mode)
(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-key
  "cc" 'evilnc-comment-or-uncomment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
