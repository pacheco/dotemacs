;;; basic identation options
(setq-default c-basic-offset 4)

;;; GDB config
(setq-default gdb-many-windows 1)

;;; c++ indentation options
(c-add-style "my-c++-style" '("cc-mode"
                             (c-offsets-alist . ((innamespace . [0]))) ; do not indent namespaces
                             ))
(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "my-c++-style")))

;;; cmake
(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists.txt" ".cmake")
  :hook (cmake-mode . (lambda ()
                        (add-to-list 'company-backends 'company-cmake))))

;;; highlighting for modern c++ features
(use-package modern-cpp-font-lock
  :ensure t
  :hook (c++-mode . modern-c++-font-lock-mode))

;;; TODO: how to set default clang-format parameters?
(use-package clang-format
  :ensure t
  :bind (:map c-mode-base-map
              ("C-c C-f" . clang-format-region)))

;;; Run "lsp-cquery-enable" in a buffer for some c/c++ project configured to use cquery.
;;; It should have a "compile_commands.json" or ".cquery" in the project root.
(use-package cquery
  :if (executable-find "cquery")
  :ensure t
  :config
  (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack")))


;;; hooks
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-h") 'c-electric-backspace)
            (setq c-auto-newline nil)
            (c-set-offset 'statement-case-open 0)
            nil))

(provide 'init-c)
