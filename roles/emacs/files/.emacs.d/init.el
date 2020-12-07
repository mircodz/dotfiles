;;; -*- lexical-binding: t -*-

(defun tangle-init ()
  (when (equal (buffer-file-name)
               (expand-file-name (concat user-emacs-directory "init.org")))
    ;; Avoid running hooks when tangling.
    (let ((prog-mode-hook nil))
      (org-babel-tangle)
      (byte-compile-file (concat user-emacs-directory "init.el")))))

(add-hook 'after-save-hook 'tangle-init)

(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1
        file-name-handler-alist last-file-name-handler-alist))

(require 'package)
(package-initialize)

(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setf use-package-always-ensure t)

(let* ((package--builtins nil)
       (packages
        '(auctex
          ccls
          company-auctex
          company-go
          company-lsp
          company-math
          company-web
          counsel
          counsel-projectile
          emmet-mode
          evil
          general
          go-eldoc
          go-guru
          go-mode
          highlight-indent-guides
          ivy-xref
          lsp-mode
          lsp-python-ms
          lsp-ui
          magit
          olivetti
          org-bullets
          pdf-tools
          projectile
          tide
          transient
          undo-tree
          use-package
          vterm
          vue-mode
          web-mode
          workgroups2
          yaml-mode)))
  (let ((packages (seq-remove 'package-installed-p packages)))
    (when packages
      ;; Install uninstalled packages.
      (package-refresh-contents)
      (mapc 'package-install packages))))

(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/"))

;; Sets all files to be backed up and auto saved in a single directory.
(setq backup-directory-alist
      `((".*" . ,emacs-autosave-directory))
      auto-save-file-name-transforms
      `((".*" ,emacs-autosave-directory t)))

(dolist (mode
         '(menu-bar-mode
           tool-bar-mode       
           tooltip-mode
           scroll-bar-mode     
           blink-cursor-mode)) 
  (funcall mode 0))

(use-package olivetti
  :custom
  (olivetti-body-width 82))

(use-package mixed-pitch
  :hook
  ((text-mode . mixed-pitch-mode)
   (text-mode . visual-line-mode)
   (text-mode . olivetti-mode)))

(set-face-attribute 'default nil :font "Source Code Pro 14")
(set-face-attribute 'fixed-pitch nil :font "Source Code Pro 14")
(set-face-attribute 'variable-pitch nil :font "Roboto Mono Light 12")

(defun pretty () 
  (interactive)
  (load-theme 'base16-tomorrow)
  (load-file "~/elegance.el")
  (setq-default olivetty-body-width 90)
  (olivetti-mode)
  (global-hl-line-mode 0))

(setq user-full-name    "Mirco De Zorzi"
      user-mail-address "mircodezorzi@protonmail.com")

(display-time-mode 1)
(unless (equal "Battery status not avalible"
               (battery))
  (display-battery-mode 1))

(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?\|)
  :hook (prog-mode . highlight-indent-guides-mode))

(global-hl-line-mode t)

(setq-default
    ;; Disable annoying indentation behaviour
    electric-indent-inhibit t
    indent-tabs-mode        nil
    tab-width               2
    evil-shift-width        2)

(defun dz/indent-setup (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n))

(defun dz/indent-tabs ()
  (interactive)
  ;; use tab instead of space
  (setq-local indent-tabs-mode t)
  ;; indent 4 spaces width
  (dz/indent-setup 4))

(defun dz/indent-spaces ()
  (interactive)
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (dz/indent-setup 2))

;(add-hook 'prog-mode-hook 'dz/indent-spaces)
;(add-hook 'lua-mode-hook 'dz/indent-spaces)
;(add-hook 'web-mode-hook 'dz/indent-spaces)

(use-package linum-relative
  :config
  (setq linum-relative-backend 'display-line-numbers-mode
        linum-relative-current-symbol "")
  :hook (prog-mode . display-line-numbers-mode))

(use-package key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define-global "eu" 'evil-normal-state))

(use-package base16-theme
  :config
  (load-theme 'base16-tomorrow-night t))

(use-package workgroups2)

(use-package general :config (general-override-mode))
(use-package evil
  :config
  (evil-mode)

  :custom
	(scroll-step                     1)
	(scroll-conservatively           10000)
  (evil-search-module              'evil-search)
  (evil-ex-complete-emacs-commands nil)
  (evil-shift-round                nil)
  (evil-vsplit-window-right        t)
  (evil-split-window-below         t)
  (evil-want-C-u-scroll            t)
	(popup-use-optimized-column-computation nil)

  :config
  (general-define-key
    :states '(normal visual motion)
      "d" 'evil-backward-char
      "n" 'evil-forward-char
      "h" 'evil-next-line
      "t" 'evil-previous-line

      "s" 'evil-ex

      "j" 'evil-delete
      "k" 'evil-find-char-to

      "l" 'evil-search-next
      "L" 'evil-search-previous

      "D" 'evil-beginning-of-line
      "N" 'evil-end-of-line
      "H" (kbd "5h")
      "T" (kbd "5t")

      "C-d" 'evil-window-left
      "C-h" 'evil-window-down
      "C-t" 'evil-window-up
      "C-n" 'evil-window-right))

(use-package lsp-mode
  :commands lsp
  :bind (:map evil-normal-state-map
          ("g r" . lsp-find-references)
          ("SPC s" . swiper-isearch))
  :config
  (setq lsp-eldoc-hook nil)
  :hook ((c++-mode c-mode go-mode latex-mode python-mode) . lsp))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable    t
        lsp-ui-doc-position  'at-point
        lsp-ui-doc-border    "white"))

(use-package company-lsp
  :commands company-lsp
  :config
  (setq company-minimum-prefix-length 1)
  (push 'company-lsp company-backends))

(use-package ccls
  :config
  ;(setq ccls-executable "ccls"
  ;      lsp-prefer-flymake nil)
  ;(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(use-package ivy-xref
  :config
  (setq xref-show-definitions-function #'ivy-xref-show-defs
        xref-show-xrefs-function       #'ivy-xref-show-xrefs))

(use-package lsp-python-ms
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))

(use-package go-mode)

(use-package company-go
  :init

  (setq company-go-show-annotation t)
  (setq company-tooltip-limit 20)
  :hook (go-mode .
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-go))
              (company-mode))))

(use-package go-eldoc
  :defer t
  :hook (go-mode . go-eldoc-setup))

(use-package go-guru
  :defer t
  :hook (go-mode . go-guru-hl-identifier-mode))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)))

(use-package web-mode
  :config
  (setq web-mode-enable-current-element-highlight t)
  :mode ("\\.ts\\'" "\\.html?\\'" "\\.css?\\'" "\\.js\\'"))

(use-package company-web)
(use-package yasnippet)
(use-package css-mode)

(use-package vue-mode
  :custom-face (mmm-default-submode-face ((t (:background "#181818" 
                                              :extend t)))))

(use-package emmet-mode
  :preface (defvar emmet-mode-keymap (make-sparse-keymap))
  :bind (:map emmet-mode-keymap
          ("C-TAB" . emmet-expand-line))
  :hook ((css-mode web-mode html-mode) . emmet-mode))

;(eval-after-load "web-mode"
;  '(set-face-background 'web-mode-current-element-highlight-face "#181818"))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)

  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files)))

(add-hook 'web-mode-hook 'prog-mode-hook)    
(add-hook 'web-mode-hook 'my-web-mode-hook)    
(add-hook 'web-mode-hook 'company-mode)    

(add-hook 'web-mode-before-auto-complete-hooks
    '(lambda ()
     (let ((web-mode-cur-language
  	    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
    	   (yas-activate-extra-mode 'php-mode)
      	 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
    	   (setq emmet-use-css-transform t)
      	 (setq emmet-use-css-transform nil)))))

(use-package org
  :config
  (add-to-list 'org-src-lang-modes '("x86asm" . asm) '("cmake" . text))
  
  :custom
  (org-directory "~/org")

  ;:hook ((org-mode . org-indent-mode)
  ;       (org-mode . flyspell-mode))

  ;:custom-face (org-block ((t (:background "#f0f0f0" 
  ;                             :extend t))))

  :custom-face (org-block ((t (:background "#181818" 
                               :extend t)))))

;(use-package org-bullets
;  :after org
;  :custom
;  (org-ellipsis "⬎")
;  :hook (org-mode . org-bullets-mode))

(use-package company-auctex)
(use-package company-math)

(add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
(add-hook 'LaTeX-mode-hook 'latex-math-mode)
(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)
(add-hook 'LaTeX-mode-hook 'TeX-fold-buffer t)

(use-package yaml-mode
  :mode ("\\.yml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-install))
(add-hook 'pdf-view-mode-hook
          (lambda () (setq header-line-format nil)))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

(use-package undo-tree
  ;:bind (:map evil-normal-state-map
  ;        ("C-u" . undo-tree-visualize))
  :config
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree))

(defun dz/find-file ()
  "Call `counsel-projectile-find-file' if `projectile-project-p', otherwise fallback to `counsel-find-files'."
  (interactive)
  (if (projectile-project-p)
      (counsel-projectile-find-file)
      (counsel-find-file)))

(use-package ivy
  :bind (:map ivy-mode-map
          ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers   t)
  (ivy-height                10)
  (ivy-count-format          "")
  (ivy-initial-inputs-alist  nil)
  (ivy-re-builders-alist     '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy projectile swiper)
  :bind (:map evil-normal-state-map
          ("SPC SPC" . counsel-M-x)
          ("SPC C-p" . counsel-projectile-switch-project)
          ("C-p" . dz/find-file)))

(use-package swiper)

(use-package projectile
  :config
  (projectile-mode)
  :custom
  (projectile-enable-caching     t)
  (projectile-completion-system 'ivy))

(use-package counsel-projectile
  :after (counsel projectile))

(use-package vterm
 :preface (setq vterm-install t))

(use-package magit)

(setq def-language "")

(defun dz/org-wrap-source ()
  (interactive)
  (let ((lang (read-string (format "Language [%s]: " def-language) nil nil def-language))
        (start (min (point) (mark)))
        (end (max (point) (mark))))
    (goto-char end)
    (unless (bolp)
      (newline))
    (insert "#+END_SRC\n")
    (goto-char start)
    (unless (bolp)
      (newline))
    (setq def-language lang)
    (insert (format "#+BEGIN_SRC %s\n" def-language))))

(define-key evil-visual-state-map (kbd "SPC w") 'dz/org-wrap-source)

;(defun dz/reload ()
;  (interactive)
;  (org-babel-load-file "~/.emacs.d/config.org"))
;
;(define-key evil-normal-state-map (kbd "SPC r") 'dz/reload)

(defun dz/open-config ()
  (interactive)
  (find-file "~/.emacs.d/init.org"))

(define-key evil-normal-state-map (kbd "SPC o c") 'dz/open-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mmm-default-submode-face ((t (:background "#181818" :extend t))))
 '(org-block ((t (:background "#181818" :extend t)))))
