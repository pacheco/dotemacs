;; Default packages to be loaded. Also downloads some of them from elpa

(defvar packages-to-install nil
  "List of packages to be installed from elpa")

; common lisp elisp extensions
(require 'cl) 
; recently opened files
(require 'recentf)
; uniquify buffer names
(require 'uniquify) 
; smarter find file at point
(require 'ffap) 
(require 'ansi-color)

(provide 'lps-default-packages)
