(setq org-log-done 'time
      org-agenda-window-setup 'current-window)

(add-hook 'org-mode-hook
          (lambda ()
            ;; evince as default external pdf reader
            (when (eq system-type 'gnu/linux)
              (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s")))))

(provide 'init-org)
