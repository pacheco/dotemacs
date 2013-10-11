;;; lps-modes --- mode specific configs

;;; Commentary:
;;; setup mode specific configurations.  Last thing it does is load all
;;; the files inside the modes folder.

;;; Code:

;;; shell mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory (concat dotemacs-dir "snippets"))
(eval-after-load 'yasnippet
  '(progn
     (yas-reload-all)
     (define-key yas-minor-mode-map (kbd "C-c <tab>") 'yas-expand)
     (define-key yas-minor-mode-map (kbd "<tab>") nil)
     (define-key yas-minor-mode-map (kbd "TAB") nil)))

;;; ggtags
(require 'ggtags)
(setq ggtags-global-window-height 15)

;;; flycheck
(require 'flycheck)

;;; magic
(require 'magit)

;;; auto-complete
(require 'auto-complete-config)
(setq ac-auto-start t
      ac-auto-show-menu 0.1
      ac-delay 0.1)
(eval-after-load 'auto-complete
  '(progn
     (define-key ac-mode-map (kbd "C-<tab>") 'auto-complete)
     ;; use c-n c-p for next/prev completion while menu is showing
     (setq ac-use-menu-map t)
     (define-key ac-menu-map (kbd "C-n") 'ac-next)
     (define-key ac-menu-map (kbd "C-p") 'ac-previous)))

;;; load mode specific configuration files
(mapcar 'load-file (directory-files (concat dotemacs-dir "modes") t ".*.el"))

(provide 'lps-modes)
;;; lps-modes ends here
