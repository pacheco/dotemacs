(setq-default c-basic-offset 4)
(require 'auto-complete-clang)
(add-hook 'c-mode-hook
          (lambda ()
            (ggtags-mode 1)
            (auto-complete-mode 1)
            (define-key (lookup-key semantic-mode-map (kbd "C-c ,")) (kbd "d")
              'semantic-ia-show-summary)
            (define-key (lookup-key semantic-mode-map (kbd "C-c ,")) (kbd "D")
              'semantic-ia-show-doc)
            (define-key semantic-mode-map (kbd "C-c C-d")
              'semantic-ia-show-doc)
            (setq ac-sources '(ac-source-gtags ac-source-clang))))

;;; regenerate gtags after saving a file inside a cpp-root ede project
;; (add-hook 'after-save-hook
;;                                    (lambda ()
;;                                      (when (ede-cpp-root-project-p (ede-current-project))
;;                                        (lps/generate-gtags))))






;; TODO: check why c-eldoc is not working...
;; (require 'c-eldoc)
;; (setq c-eldoc-includes " -I./ -I../ -I.../  -I./include/ -I../include/ -I../../include/ -I${HOME}/usr/include/ ")
;; (add-hook 'c-mode-hook (lambda () (c-turn-on-eldoc-mode 1)))

