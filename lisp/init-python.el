(require-package 'elpy)

(elpy-enable)


;;; Anaconda
;; (require-package 'anaconda-mode)
;; (require-package 'company-anaconda)

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (anaconda-mode 1)
;;             (add-to-list 'company-backends 'company-anaconda)))

(provide 'init-python)
