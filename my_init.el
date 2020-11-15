;; edit this file with F2 F2
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/my_init.org"))
(global-set-key (kbd "<f2><f2>") 'open-init-file)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(set-face-attribute 'default nil :height 140)
;; (fset 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode 1)
;; (setq auto-revert-verbose nil) ;;message for auto revert
;; (global-set-key (kbd "<f5>") 'revert-buffer)
(require 'org-tempo)

;; share system clipboard
(setq x-select-enable-clipboard t)

(use-package try
	     :ensure t)

(use-package org-bullets
             :ensure t
             :config
             (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/Dropbox/orgfiles")
 '(org-default-note-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-starts t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
)

(global-set-key "\C-ca" 'org-agenda)

(use-package org-ac
  :ensure t
  :init (progn
          (require 'org-ac)
          (org-ac/config-default)
          ))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/Dropbox/orgfiles/gcal.org"
                             "~/Dropbox/orgfiles/i.org"
                             "~/Dropbox/orgfiles/schedule.org"))

(setq org-capture-templates
      '(("a" "Appointment" entry (file  "~/Dropbox/orgfiles/gcal.org" "Appointments")
         "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
        ("n" "Note" entry (file+headline "~/Dropbox/orgfiles/notes.org" "Notes")
         "* Note %?\n%T")
        ("l" "Link" entry (file+headline "~/Dropbox/orgfiles/links.org" "Links")
         "* %? %^L %^g \n%T" :prepend t)
        ("b" "Blog idea" entry (file+headline "~/Dropbox/orgfiles/i.org" "Blog Topics:")
         "* %?\n%T" :prepend t)
        ("t" "To Do Item" entry (file+headline "~/Dropbox/orgfiles/i.org" "To Do Items")
         "* %?\n%T" :prepend t)
        ("j" "Journal" entry (file+datetree "~/Dropbox/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("s" "Screencast" entry (file "~/Dropbox/orgfiles/screencastnotes.org")
         "* %?\n%i\n")))


;; capture

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-destroy
    (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(use-package noflet
  :ensure t )
(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
          (org-capture)))
;; bind make-capture-frame to some key in the system shortcut

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
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line))
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

;;(use-package auto-complete
;;  :ensure t
;;  :init
;;  (progn
;;    (ac-config-default)
;;    (global-auto-complete-mode t)
;;    ))

(use-package company
    :ensure t
    :config
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-idle-delay 1)
)

(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))

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

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)

;; use current buffer when entering new directory
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; C-x C-j to enter current directory
(require 'dired-x)

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

(setq save-interprogram-paste-before-kill t)
