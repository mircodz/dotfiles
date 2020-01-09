; emacs configuration
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-default-dark)))
 '(custom-safe-themes
   (quote
    ("16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" default)))
 '(package-selected-packages
   (quote
    (evil-nerd-commenter evil-leader org-bullets hasklig-mode use-package fill-column-indicator linum-relative base16-theme fzf evil))))

(set-face-attribute 'default nil
                    :family "Hasklig"
                    :height 125
                    :weight 'normal
                    :width 'normal)

(use-package hasklig-mode
  :hook (haskell-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(global-evil-leader-mode)
(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-key
  "cc" 'evilnc-comment-or-uncomment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
)

(global-prettify-symbols-mode t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

; Relative Line Numbers
(require 'linum-relative)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

; 80th Colmn Rule
(require 'fill-column-indicator)

;(add-hook 'emacs-lisp-mode-hook (lambda ()
;  (hl-line-mode) ; Cursorline
;  (fci-mode 1)))

; Evil Mode
(require 'evil)
(evil-mode t)

(define-key evil-insert-state-map "d" nil)

(define-key evil-motion-state-map "s" 'evil-ex)
(define-key evil-normal-state-map "s" 'evil-ex)
(define-key evil-visual-state-map "s" 'evil-ex)

(define-key evil-motion-state-map "d" 'evil-backward-char)
(define-key evil-motion-state-map "n" 'evil-forward-char)
(define-key evil-motion-state-map "h" 'evil-next-line)
(define-key evil-motion-state-map "t" 'evil-previous-line)

(define-key evil-normal-state-map "d" 'evil-backward-char)
(define-key evil-normal-state-map "n" 'evil-forward-char)
(define-key evil-normal-state-map "h" 'evil-next-line)
(define-key evil-normal-state-map "t" 'evil-previous-line)

(define-key evil-visual-state-map "d" 'evil-backward-char)
(define-key evil-visual-state-map "n" 'evil-forward-char)
(define-key evil-visual-state-map "h" 'evil-next-line)
(define-key evil-visual-state-map "t" 'evil-previous-line)

(define-key evil-normal-state-map "D" 'evil-beginning-of-line)
(define-key evil-normal-state-map "N" 'evil-end-of-line)
(define-key evil-visual-state-map "D" 'evil-beginning-of-line)
(define-key evil-visual-state-map "N" 'evil-end-of-line)

(define-key evil-motion-state-map "H" '(lambda () (interactive) (evil-next-line 5)))
(define-key evil-motion-state-map "T" '(lambda () (interactive) (evil-previous-line 5)))
(define-key evil-visual-state-map "H" '(lambda () (interactive) (evil-next-line 5)))
(define-key evil-visual-state-map "T" '(lambda () (interactive) (evil-previous-line 5)))

(define-key evil-visual-state-map "j" 'evil-delete)
(define-key evil-visual-state-map "k" 'evil-find-char-to)
(define-key evil-normal-state-map "j" 'evil-delete)
(define-key evil-normal-state-map "k" 'evil-find-char-to)

(define-key evil-normal-state-map (kbd "C-d") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-t") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-window-right)

(define-key evil-visual-state-map (kbd "C-d") 'evil-window-left)
(define-key evil-visual-state-map (kbd "C-h") 'evil-window-down)
(define-key evil-visual-state-map (kbd "C-t") 'evil-window-up)
(define-key evil-visual-state-map (kbd "C-n") 'evil-window-right)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "eu" 'evil-normal-state)
(key-chord-mode 1)

(define-key evil-normal-state-map (kbd "C-p") 'fzf)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 2.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
