(require-package 'tuareg)
(require-package 'merlin)
(require-package 'ocp-indent)
(require-package 'utop)

(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))

(provide 'init-ocaml)
