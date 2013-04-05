;;; Default packages to be loaded and/or downloaded from elpa

(defvar elpa-packages '(c-eldoc
                        yasnippet
                        nrepl
                        w3m
                        auto-complete
                        auto-complete-clang
                        jedi)
  "Packages to install from elpa")

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

;;; theme stuff
(require 'subatomic-theme-autoloads)

(provide 'lps-default-packages)
