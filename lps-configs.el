;;; General emacs configurations
;;; 


;;; setup exec path
(setenv "PATH" (concat (getenv "PATH")
                       ":" (expand-file-name "~/usr/bin")))
(add-to-list 'exec-path (expand-file-name "~/usr/bin"))
(add-to-list 'exec-path (expand-file-name "/usr/local/bin"))

;;; y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-message t)
(when window-system
  (global-font-lock-mode 1))

;;; display some useful stuff
(display-time-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode t)

;;; show tooltips inside the echo area
(tooltip-mode -1)
(blink-cursor-mode 1)

;;; not sure if these is necessary
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(transient-mark-mode -1)
(setq mouse-yank-at-point t)

;;; do not insert tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;;; nicer buffer naming
(toggle-uniquify-buffer-names)
(setq uniquify-buffer-name-style  'forward)

(setq term-buffer-maximum-size 10000)

;;; automatically add newline to end of files
(setq require-final-newline t)

;;; integrate with X clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; no backup files all around, put them all into same directory under home
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;;; highlight current line
(global-hl-line-mode 1)

;;; enable commands
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; do NOT vertically split windows automatically
;;; (split-window-vertically still works)
(setq split-height-threshold 99999)

;;; hippie-expand functions
(setq hippie-expand-try-functions-list '(try-expand-all-abbrevs
                                         try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-list))

;;; put new frames on the top corner
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))

;;; ido-mode
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-enable-prefix nil)

(recentf-mode t)

;;; default browser
(setq browse-url-browser-function `((".*" . browse-url-default-browser)))

;;; open buffers on current window
;;; (setq pop-up-windows nil)

;;; start emacs server
(server-start)

(provide 'lps-configs)
