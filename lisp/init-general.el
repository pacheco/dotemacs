;;; y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;;; display useful stuff
(global-font-lock-mode 1)
(display-time-mode 0)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(blink-cursor-mode 1)
(global-hl-line-mode 1)
(setq indicate-empty-lines t)
(setq visible-bell t)
(setq-default show-trailing-whitespace t)

;;; nicer buffer naming
(require 'uniquify)

(toggle-uniquify-buffer-names)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;;; show tooltips inside the echo area
(tooltip-mode -1)

(setq mouse-yank-at-point t)
(mwheel-install)

;;; need to require dired for dired-jump
(require 'dired)

;;; editing
(setq fill-column 80)
(transient-mark-mode -1)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(delete-selection-mode 1)
(setq-default save-interprogram-paste-before-kill t)
(setq-default scroll-preserve-screen-position 'always)
;(global-subword-mode 1)

;;; always use UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; automatically add newline to end of files
(setq-default require-final-newline t)

;;; integrate with X clipboard
(if (eq window-system 'x)
    (progn
      (setq x-select-enable-clipboard t)
      (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)))

;;; no backup files all around, put them all into same directory under home
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;;; move files to trash when deleting
(setq delete-by-moving-to-trash t)

;;; enable commands
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; do NOT vertically split windows automatically
(setq split-height-threshold nil)
(setq split-width-threshold 160)

;;; ibuffer
(setq ibuffer-restore-window-config-on-quit t)

;;; ido-mode
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t
      ido-enable-prefix nil
      ; ido-use-virtual-buffers nil ;; option to show recentf when switching buffers
      ido-use-filename-at-point nil)

;;; compilation window points to first error
(setq-default compilation-scroll-output 'first-error)

;;; recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100
      recentf-exclude '("/tmp/" "/ssh:"))

;; save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;;; smarter find file at point
(require 'ffap)

;;; hippie expand
(setq hippie-expand-try-functions-list '(try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol
                                         try-expand-list))

(provide 'init-general)
