(use-package org
  :bind (("C-c c" . org-capture))
  :config
  (setq org-log-done 'time
        org-agenda-window-setup 'current-window
        org-dir "~/Dropbox/org"
        org-default-notes-file "~/Dropbox/org/notes.org"
        org-agenda-files '("~/Dropbox/org/notes.org")
        org-capture-templates '(("t" "Todo" entry (file+headline "" "Tasks")
                                 "* TODO %?\n   %i\n  %a")
                                ("T" "Thesis Todo" entry (file+headline "" "Thesis Tasks")
                                 "* TODO %?\n   %i\n  %a")
                                ("N" "Code note" entry (file+headline "" "Code notes")
                                 "* %?\n  %T\n  %l\n\n   %i")
                                ("n" "Note" entry (file+headline "" "Notes"))
                                ("r" "Random thoughts" item (file+olp+datetree "" "Random thoughts"))
                                ("c" "Check later" entry (file+headline "" "Check later"))))
  (when (eq system-type 'gnu/linux)
    ;; evince as default external pdf reader
    (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(provide 'init-org)
