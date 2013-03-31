;;; Default packages to be loaded

(defvar elpa-packages '(yasnippet c-eldoc)
  "Packages to install from elpa")

(dolist (package elpa-packages)
  "Install packages from elpa"
  (unless (or (member package package-activated-list)
              (functionp package))
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

(provide 'lps-default-packages)
