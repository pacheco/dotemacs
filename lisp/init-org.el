(use-package org
  :config
  (setq org-log-done 'time
        org-agenda-window-setup 'current-window)
  (when (eq system-type 'gnu/linux)
    ;; evince as default external pdf reader
    (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(provide 'init-org)
