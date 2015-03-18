;;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

;;; lisp dir has my config and lisp code
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;; site-lisp has external lisp code
(let ((eldir (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path eldir)
  (let ((default-directory eldir))
    (normal-top-level-add-subdirs-to-load-path)))

;;; LOAD CONFIG FILES
;;; --------------------
(require 'init-general) ;; general config
(require 'init-utils) ;; random utilities/functions
(require 'init-keys) ;; basic keybindings
(require 'init-elpa) ;; elpa config
(require 'init-path) ;; setting exec-path
(require 'init-theme) ;; appearance

(require 'init-auto-complete)
(require 'init-windows) ;; winner mode and window stuff
(require 'init-git)
(require 'init-org)

(require 'init-c)
(require 'init-python)
(require 'init-paredit)
(require 'init-elisp)
(require 'init-lisp)
(require 'init-go)
(require 'init-erlang)
(require 'init-elixir)
(require 'init-yas)
(require-package 'lua-mode)

; check purcell/init-grep
; check purcell/init-sessions
; check undo-tree global-undo-tree-mode

;;; --------------------

;;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; load local config file if it exists
(let ((local-config (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-config)
    (load local-config)))

;;; put 'customize' variables into a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
