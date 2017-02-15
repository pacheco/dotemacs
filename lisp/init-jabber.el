(require-package 'jabber)
(setq jabber-account-list '(("le.pacheco@gmail.com"
                             (:network-server . "talk.google.com")
                             (:port . 5223)
                             (:connection-type . ssl)))

      jabber-alert-presence-message-function (lambda (who oldstatus newstatus statustext)
                                               nil)
      jabber-history-enabled t
      jabber-use-global-history nil
      jabber-backlog-number 40
      jabber-backlog-days 30)



(provide 'init-jabber)
