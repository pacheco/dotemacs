(use-package exec-path-from-shell
  :ensure t
  :defer 5 ; load it when emacs is idle
  :config
  (dolist (var '("SSH_AUTH_SOCK"
               "SSH_AGENT_PID"
               "GPG_AGENT_INFO"
               "LANG"
               "LC_CTYPE"
               "LD_LIBRARY_PATH"
               "LD_LIBRARY_PATH"
               "C_INCLUDE_PATH"
               "CPLUS_INCLUDE_PATH"
               "CARGO_HOME"))
    (add-to-list 'exec-path-from-shell-variables var))
  (delete "-i" exec-path-from-shell-arguments) ; all vars should be set in .profile
  (exec-path-from-shell-initialize))

(provide 'init-env)
