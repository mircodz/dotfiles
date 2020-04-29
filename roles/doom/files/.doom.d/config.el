(setq
  user-full-name "Mirco De Zorzi"
  user-mail-address "mircodezorzi@protonmail.com"

  doom-font (font-spec :family "Source Code Pro" :size 17)
  doom-theme 'doom-tomorrow-night

  evil-split-window-below  t
  evil-vsplit-window-right t

  yas-snippet-dirs '("~/.doom/snippets")

  org-directory "~/org/"

  +pretty-code-symbols '(:name         "»"
                         :src_block     "»"
                         :src_block_end "«"
                         :lambda        "λ"
                         :composition   "∘"
                         :map           "↦"
                         :not           "￢")

  display-line-numbers-type 'relative

  emojify-emoji-set "twemoji-v2")

(evil-mode t)

;; (add-hook 'after-init-hook #'global-emojify-mode)

(global-evil-leader-mode)
(evil-leader/set-leader ";")
(evil-leader/set-key
 "cc" 'evilnc-comment-or-uncomment-lines
 "cp" 'evilnc-comment-or-uncomment-paragraphs
 "cr" 'comment-or-uncomment-region)

(setq key-chord-two-keys-delay 0.05)
(key-chord-define evil-insert-state-map "eu" 'evil-normal-state)
(key-chord-mode 1)

(after! evil-snipe
 (evil-snipe-mode -1))

(after! company
 (setq company-idle-delay            0.5
       company-minimum-prefix-length 3))

;; (map!
;;   :after treemacs
;;   :map treemacs-mode-map
;;   :nvm (kbd "h") #'treemacs-next-line
;;   :nvm (kbd "t") #'treemacs-previous-line)

(map!
  :after notmuch
  :map notmuch-search-mode-map
  :nvm "d" #'evil-backward-char
  :nvm "t" #'evil-previous-line
  :nvm "C-t" #'evil-window-up)

(map!
 :after evil-org
 :map evil-org-mode-map
 :nvm "d" #'evil-backward-char
 :nvm (kbd "M-t") #'org-metaup
 :nvm (kbd "M-h") #'org-metadown
 :nvm (kbd "<f2>") #'org-latex-export-to-pdf)

;; (map!
;;  :after pass
;;  :map pass-mode-map
;;  "h" #'pass-next-entry
;;  "t" #'pass-prev-entry
;;  "C-d" #'evil-window-left
;;  "C-h" #'evil-window-down
;;  "C-t" #'evil-window-up
;;  "C-n" #'evil-window-right)

(map!
 :nvm "M-+" #'doom/increase-font-size
 :nvm "M--" #'doom/decrease-font-size

 :nvm "s" #'evil-ex

 :nvm "d" #'evil-backward-char
 :nvm "n" #'evil-forward-char
 :nvm "h" #'evil-next-line
 :nvm "t" #'evil-previous-line

 :nvm "D" #'evil-beginning-of-line
 :nvm "N" #'evil-end-of-line
 :nvm "H" (kbd "5h")
 :nvm "T" (kbd "5t")

 :nvm "j" #'evil-delete
 :nvm "k" #'evil-find-char-to

 :nvm "C-d" #'evil-window-left
 :nvm "C-h" #'evil-window-down
 :nvm "C-t" #'evil-window-up
 :nvm "C-n" #'evil-window-right

 :nvm "C-k" #'evil-insert-digraph)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
