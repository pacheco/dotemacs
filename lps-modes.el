;; Mode specific configs

;;; cedet and semantic
(require 'cedet)
(require 'semantic)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semantic-add-system-include "~/usr/include/" 'c-mode)
(semantic-mode 1)
(global-ede-mode 1)
(ede-enable-generic-projects)

;;; c mode
(require 'c-eldoc)
(setq c-eldoc-includes " -I./ -I../ -I.../  -I./include/ -I../include/ -I../../include/ -I${HOME}/usr/include/ ")
(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook (lambda ()
                         ;;(c-turn-on-eldoc-mode 1)
                         (gtags-mode 1)
                         ))

;;; shell mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda ()
                                        (paredit-mode 1)
                                        (eldoc-mode 1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode 1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode 1)))

(eval-after-load 'paredit
  '(progn (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
          (define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)
          ;; (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)
          ;; (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
          (define-key paredit-mode-map (kbd "M-<right>") 'paredit-forward-slurp-sexp)
          (define-key paredit-mode-map (kbd "M-<left>") 'paredit-forward-barf-sexp)))

;;; winner mode
(winner-mode 1)

;;; flymake
(require 'flymake)

;;; yasnippet
(require 'yasnippet)
(yas-load-directory "~/.emacs.d/snippets")


;;; go mode
(require 'go-mode-load)
(add-hook 'go-mode-hook (lambda ()
                          (yas-minor-mode 1)))

;;; clojure
(require 'nrepl)
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode
          (lambda () (paredit-mode 1)))

;; common lisp / slime
(when (file-exists-p "~/quicklisp")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl"))

(provide 'lps-modes)
