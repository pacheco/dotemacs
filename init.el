;; This is where all the loading/configuration begins
;; 
;; Inspired by https://github.com/technomancy/emacs-starter-kit
;; 
;; See COPYING for licence

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; load path
(setq dotemacs-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotemacs-dir)
(add-to-list 'load-path (concat dotemacs-dir "/el"))
(setq autoload-file (concat dotemacs-dir "loaddefs.el"))

;; setup elpa
(setq package-user-dir (concat dotemacs-dir "elpa"))
(require 'package)
(setq package-archives '(
			 ;("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
             ("gnu" . "http://elpa.gnu.org/packages/")
             ))
(package-initialize)

;; load other configuration files
(require 'lps-default-packages)
(require 'lps-configs)
(require 'lps-defuns)
(require 'lps-modes)
(require 'lps-bindings)
