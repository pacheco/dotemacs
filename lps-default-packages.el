;;; Default packages to be loaded and/or downloaded from elpa

(defvar elpa-packages '(c-eldoc
                        yasnippet
                        w3m
                        auto-complete
                        auto-complete-clang
                        jedi
                        flycheck
                        magit
                        lua-mode)
  "Packages to install from elpa.")

(unless package-archive-contents
  (package-refresh-contents))
(dolist (package elpa-packages)
  "Install packages from elpa"
  (unless (package-installed-p package)
    (package-install package)))

;;; common lisp elisp extensions
(require 'cl) 
;;; recently opened files
(require 'recentf)
;;; uniquify buffer names
(require 'uniquify) 
;;; smarter find file at point
(require 'ffap)
(require 'ansi-color)

;;; subatomic theme
(require 'subatomic-theme-autoloads)

(provide 'lps-default-packages)
