;;; clojure
(require 'nrepl)
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode
          (lambda () (paredit-mode 1)))
