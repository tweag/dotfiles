;;; NOTE: Requires at least Emacs version 24 for package To install
;;; Emacs see: http://wikemacs.org/wiki/Installing_Emacs_on_OS_X
;;; and/or https://emacsformacosx.com
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;;; Provide vimmy escape hatch to `evil-mode'.  Press ⌘-/ or M-⌘-/ to
;;; toggle `evil-mode'.
(global-set-key (kbd "s-/") 'evil-mode)
(global-set-key (kbd "M-/") 'evil-mode)
(global-set-key (kbd "M-s-/") 'evil-mode)

;; "y or n" instead of "yes or no"
(defalias 'yes-or-no-p 'y-or-n-p)

(unless (package-installed-p 'magit)
  (package-install 'magit))
(require 'magit)
;; M-x git to show `magit-status'
(defalias 'git 'magit-status)

;; Use `ibuffer' instead of the default buffer `list-buffers' interface
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Use ido-mode and a vertical layout for handy buffer switching.
;; Sourced from
;; https://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html ,
;; which as it turns out, is a great resource for setting emacs up to
;; work on Rails projects.
;; NOTE: You'll need to M-x `customize-group' `ido' and set Ido Mode
;; to `both' to enable `ido-mode' for both file and buffer switching.
(unless (package-installed-p 'ido)
  (package-install 'ido))
(require 'ido)
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; Setup `flx-ido' for fuzzy file and buffer finding.  Kind of like C-p in `vim'
(unless (package-installed-p 'flx-ido)
  (package-install 'flx-ido))
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)

;; And if you want to use `ido' to browse directories with dired (who
;; doesn't?), you'll need to set this:
(setq ido-show-dot-for-dired t)

;; Let's try using `projectile'!
;; See: https://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c C-p f") 'projectile-find-file)
(global-set-key (kbd "C-c C-p C-f") 'projectile-find-file)

;;; Let's use `company-mode' for completions!
(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Disable the toolbar
(tool-bar-mode -1)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;;; Load .emacs.local without protesting if it's not present.
(load "~/.emacs.local" 1)

;; BELOW HERE BE DRAGONS
