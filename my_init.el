(setq inhibit-startup-message t)
(tool-bar-mode -1)
; (fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(require 'org-tempo)

(use-package try
	     :ensure t)

(use-package org-bullets
	     :ensure t
	     :config
	     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)
; (ido-mode 1)

(defalias 'list-buffers 'ibuffer-other-window)

; (use-package tabbar
;   :ensure t
;   :config (tabbar-mode 1)
;   )

(windmove-default-keybindings)

(use-package ace-window
	     :ensure t
	     :init
	     (progn
	       (global-set-key [remap other-window] 'ace-window)
	       (custom-set-faces
		'(aw-leading-char-face
		  ((t (:inherit ace-jump-face-foreground :height 3.0)))))
	       ))

(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "M-s") 'avy-goto-char))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package atom-one-dark-theme
  :ensure t
  :config (load-theme 'atom-one-dark t))

; (use-package flycheck
;   :ensure t
;   :init
;   (global-flycheck-mode t))

; (use-package jedi
;   :ensure t
;   :init
;   (add-hook 'python-mode-hook 'jedi:setup)
;   (add-hook 'python-mode-hook 'jedi:ac-setup))

; (use-package yasnippet
;   :ensure t
;   :init
;   (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(global-hl-line-mode t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ;; (setq beacon-color "#666600")
  )

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
  :ensure t)
