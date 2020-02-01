(add-to-list 'custom-theme-load-path "~/code/base16-emacs/build")
(add-to-list 'load-path "~/code/base16-emacs")

(setq user-full-name "Mirco De Zorzi"
      user-mail-address "mircodezorzi@protonmail.com"

      doom-font (font-spec :family "Source Code Pro" :size 15)
      doom-theme 'base16-default-dark

      org-directory "~/org/"

      display-line-numbers-type 'relative)

(evil-mode t)

(global-evil-leader-mode)
(evil-leader/set-leader ";")
(evil-leader/set-key
  "cc" 'evilnc-comment-or-uncomment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region)

(setq key-chord-two-keys-delay 0.05)
(key-chord-define evil-insert-state-map "eu" 'evil-normal-state)
(key-chord-mode 1)

(map!
  :map neotree-mode-map
  :after neotree
  :nvm "d" #'evil-backward-char
  :nvm "j" #'neotree-delete-node)

(map!
  :after evil-org
  :map evil-org-mode-map
  :nvm "d" #'evil-backward-char
  :nvm (kbd "M-t") #'org-metaup
  :nvm (kbd "M-h") #'org-metadown)

(map!
  :nvm (kbd "M-+") #'doom/increase-font-size
  :nvm (kbd "M--") #'doom/decrease-font-size

  :nvm "s" #'evil-ex

  :nvm "d" #'evil-backward-char
  :nvm "n" #'evil-forward-char
  :nvm "h" #'evil-next-line
  :nvm "t" #'evil-previous-line

  :nvm "D" #'evil-beginning-of-line
  :nvm "N" #'evil-end-of-line
  :nvm "H" #'(lambda () (interactive) (evil-next-line     5))
  :nvm "T" #'(lambda () (interactive) (evil-previous-line 5))

  :nvm "j" #'evil-delete
  :nvm "k" #'evil-find-char-to

  :nvm (kbd "C-d") #'evil-window-left
  :nvm (kbd "C-h") #'evil-window-down
  :nvm (kbd "C-t") #'evil-window-up
  :nvm (kbd "C-n") #'evil-window-right)

(after! evil-snipe
  (evil-snipe-mode -1))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(defun highlight-selected-window ()
  "Highlight selected window with a different background color."
  (walk-windows (lambda (w)
                  (unless (eq w (selected-window))
                    (with-current-buffer (window-buffer w)
                      (buffer-face-set '(:background "#282828"))))))
  (buffer-face-set 'default))
(add-hook 'buffer-list-update-hook 'highlight-selected-window)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(setq +pretty-code-symbols nil)
