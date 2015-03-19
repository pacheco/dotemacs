(require-package 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)

(setq tab-always-indent 'complete)

(setq-default ac-auto-start nil)
(setq-default ac-dwim t)
(setq-default ac-use-menu-map t)
;;(setq-default ac-auto-show-menu 0.1)
;;(setq-default ac-delay 0.5)

(eval-after-load 'auto-complete
   '(progn
      (define-key ac-mode-map (kbd "C-<tab>") 'auto-complete)
      (define-key ac-menu-map (kbd "C-n") 'ac-next) ;; use c-n c-p for next/prev completion while menu is showing
      (define-key ac-menu-map (kbd "C-p") 'ac-previous)))

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))


(provide 'init-auto-complete)
