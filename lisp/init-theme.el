;; (set-default-font "DejaVu Sans Mono-13")
(set-default-font "Monaco-13")
;; (set-default-font "Noto Mono-13")
;; (set-default-font "Liberation Mono-13")
;; (set-default-font "Inconsolata-15")
;; (set-default-font "ProggyCleanTTSZ-12.5")

;; (require-package 'color-theme-sanityinc-solarized)
;; (require-package 'zenburn-theme)
;; (require-package 'leuven-theme)
;; (require-package 'plan9-theme)
;; (require-package 'github-theme)
;; (require-package 'yoshi-theme)
;; (require-package 'railscasts-theme)
;; (require-package 'blackboard-theme)
;; (require-package 'flatland-theme)
;; (require-package 'nimbus-theme)
;; (require-package 'nord-theme)

;;; LIGHT themes
;;; --------------------
;; (load-theme 'plan9 t)
;; (load-theme 'sanityinc-solarized-light t)
;; (load-theme 'leuven t)
;; (load-theme 'whiteboard t)
;; (load-theme 'dichromacy t)

;; (load-theme 'github t)
;; (custom-theme-set-faces
;;  'github
;;  '(default ((t (:background "#eee5cf"))))
;;  '(font-lock-variable-name-face ((t (:foreground "firebrick3"))))
;;  '(font-lock-keyword-face ((t (:foreground "magenta4"))))
;;   '(font-lock-preprocessor-face ((t (:foreground "magenta4" :slant italic))))
;;  '(font-lock-type-face ((t (:foreground "DodgerBlue4"))))
;;  '(font-lock-constant-face ((t (:foreground "DodgerBlue3"))))
;;  '(font-lock-function-name-face ((t (:foreground "red4"))))
;;  '(font-lock-string-face ((t (:foreground "green4"))))
;;  '(mode-line-buffer-id ((t (:weight bold))))
;;  '(mode-line-inactive ((t (:foreground "grey40" :background "grey85"))))
;;  '(mode-line ((t (:foreground "grey95" :background "grey20"))))
;;  '(trailing-whitespace ((t (:background "seashell3")))))


;; (load-theme 'tango t)
;; (custom-theme-set-faces
;;  'tango
;;  '(font-lock-keyword-face ((t (:foreground "#a71d5d"))))
;;  '(font-lock-type-face ((t (:foreground "#204fc7"))))
;;  '(font-lock-string-face ((t (:foreground "#228b22"))))
;;  '(font-lock-function-name-face ((t (:foreground "#a40000" :weight bold))))
;;  ;; '(font-lock-function-name-face ((t (:foreground "#795da3" :weight bold))))
;;  '(font-lock-builtin-face ((t (:foreground "#ff006f"))))
;;  '(highlight ((t (:background "#dddddd")))))

;; keyword #a71d5d
;; built-in #a71d5d
;; function name #795da3
;; type #0086b3
;; constant #0086b3

;;; DARK themes
;;; ---------------------
;; (load-theme 'zenburn t)
;; (load-theme 'railscasts t)
;; (load-theme 'misterioso t)
;; (load-theme 'nimbus t)
;; (load-theme 'deeper-blue t)
;; (load-theme 'wombat t)
;; (load-theme 'blackboard t)
;; (load-theme 'yoshi t)
;; (load-theme 'tango-dark t)
;; (load-theme 'wheatgrass t)
;; (load-theme 'sanityinc-solarized-dark t)
;; (load-theme 'flatland t)

(load-theme 'nord t)
(custom-theme-set-faces
 'nord
 ;; '(font-lock-comment-face ((t (:foreground "SlateGray4"))))
 '(font-lock-comment-face ((t (:foreground "LightCyan4"))))
 '(font-lock-variable-name-face ((t (:foreground "SlateGray1"))))
 '(font-lock-doc-face ((t (:foreground "aquamarine"))))
 '(trailing-whitespace ((t (:background "light blue")))))

(provide 'init-theme)
