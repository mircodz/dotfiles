(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  ;(package-refresh-contents)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  (setf use-package-always-ensure t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 '("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default))
 '(package-selected-packages
	 '(org-bullets transient magit ivy-xref counsel-projectile counsel undo-tree org-make-toc ox ox-hugo helm-swoop company-math company-auctex vterm yaml-mode general workgroups2 highlight-indent-guides go-guru go-eldoc company-go go-mode helm-ag helm-projectile projectile lsp-python-ms helm evil ccls company-lsp lsp-ui lsp-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-folded-face ((t (:inherit normal))))
 '(org-level-1 ((t (:weight bold :height 1.1))))
 '(org-level-2 ((t (:weight bold :height 1.07))))
 '(org-level-3 ((t (:weight bold :height 1.05))))
 '(org-level-4 ((t (:weight bold :height 1.02)))))

(require 'org)

(org-babel-load-file "~/.emacs.d/config.org" )
