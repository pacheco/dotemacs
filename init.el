;;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

;;; higher gc threshold during startup to speed things up (does it actually improve it?)
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))

;;; ELPA config
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ))

(setq package-enable-at-startup nil)
(package-initialize)

;;; make sure use-package is available
(require 'package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;;; lisp dir has my config and lisp code
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;; site-lisp has external lisp code
(let ((eldir (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path eldir)
  (let ((default-directory eldir))
    (normal-top-level-add-subdirs-to-load-path)))

;;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; LOAD SPECIFIC CONFIG
;;; --------------------
(require 'init-general) ;; general config
(require 'init-utils) ;; random utilities/functions
(require 'init-keys) ;; basic keybindings
(require 'init-env) ;; loading env vars
(require 'init-theme) ;; appearance
(require 'init-windows) ;; winner mode and other window related stuff

(require 'init-org)
(require 'init-yas)
(require 'init-company)
(require 'init-rg)
;; (require 'init-ag)

;; (use-package sr-speedbar
;;   :ensure t)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(require 'init-paredit)
(require 'init-elisp)

;; language server protocol support
(use-package eglot
  :ensure t)

;; (use-package lsp-mode :ensure t)
;; (use-package company-lsp :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-lsp))

(require 'init-c)
(require 'init-rust)
(require 'init-python)
(require 'init-lisp)
(require 'init-go)
(require 'init-latex)
;; (require 'init-erlang)
;; (require 'init-elixir)
;; (require 'init-scala)
;; (require 'init-clojure)
;; (require 'init-capnp)
;; (require 'init-jabber)
;; (require 'init-javascript)
;; (require 'init-ocaml)

(use-package markdown-mode :ensure t)
(use-package protobuf-mode :ensure t)
(use-package toml-mode :ensure t)
(use-package yaml-mode :ensure t)
(use-package lua-mode :ensure t)

;; (use-package academic-phrases)

;; check projectile
;; check realgud
;; check purcell/init-sessions
;; check undo-tree global-undo-tree-mode

;;; --------------------

;;; load local config file if it exists
(let ((local-config (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-config)
    (load local-config)))

;;; put 'customize' variables into a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
