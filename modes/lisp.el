;; common lisp / slime
(when (file-exists-p "~/quicklisp")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl"))
