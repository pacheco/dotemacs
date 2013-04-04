(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook (lambda ()
                         (gtags-mode 1)))

;;; regenerate gtags after saving a file inside a cpp-root ede project
;; (add-hook 'after-save-hook
;;                                    (lambda ()
;;                                      (when (ede-cpp-root-project-p (ede-current-project))
;;                                        (lps/generate-gtags))))






;; TODO: check why c-eldoc is not working...
;; (require 'c-eldoc)
;; (setq c-eldoc-includes " -I./ -I../ -I.../  -I./include/ -I../include/ -I../../include/ -I${HOME}/usr/include/ ")
;; (add-hook 'c-mode-hook (lambda () (c-turn-on-eldoc-mode 1)))

