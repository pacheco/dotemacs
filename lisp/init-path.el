(require-package 'exec-path-from-shell)

(require 'exec-path-from-shell)

(dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
  (add-to-list 'exec-path-from-shell-variables var))

(exec-path-from-shell-initialize)

(provide 'init-path)
