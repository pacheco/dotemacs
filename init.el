;;; init.el --- This is where everything starts

;;; Commentary:
;;; Inspired by https://github.com/technomancy/emacs-starter-kit
;;; 
;;; See COPYING for licence

;;; Code:

;;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq debug-on-error t)

;;; load path
(defconst dotemacs-dir (file-name-directory
                        (or (buffer-file-name) load-file-name))
  "Points to my .emacs directory.")
(add-to-list 'load-path dotemacs-dir)
(let ((eldir (concat dotemacs-dir "/el")))
  (add-to-list 'load-path eldir)
  (let ((default-directory eldir))
    (normal-top-level-add-subdirs-to-load-path)))

;;; setup elpa
(setq package-user-dir (concat dotemacs-dir "elpa"))
(require 'package)
(setq package-archives '(
			 ;("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
             ("gnu" . "http://elpa.gnu.org/packages/")
             ))
(package-initialize)

;;; load other configuration files
(require 'lps-default-packages)
(require 'lps-configs)
(require 'lps-defuns)
(require 'lps-modes)
(require 'lps-bindings)

;;; local machine specific configurations should be put inside local.el
(let ((local-configs-file (concat dotemacs-dir "local.el")))
  (if (file-exists-p local-configs-file)
      (load local-configs-file)))

;;; init.el ends here
