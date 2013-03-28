;; This is where all the loading/configuration begins
;; 
;; Inspired by https://github.com/technomancy/emacs-starter-kit
;; 
;; See COPYING for licence

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq dotemacs-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotemacs-dir)
(add-to-list 'load-path (concat dotemacs-dir "/el"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))

(package-initialize)
(setq package-user-dir (concat dotfiles-dir "elpa"))
(require 'default-packages)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ;("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(require 'lps-default-packages)
(require 'lps-defuns)

