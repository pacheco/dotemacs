(setq org-log-done 'time
      org-agenda-window-setup 'current-window)

;;; evince as default pdf reader
(when (eq system-type 'gnu/linux)
  (add-to-list 'org-file-apps
               '("\\.pdf\\'" . "evince %s")))

(provide 'init-org)
