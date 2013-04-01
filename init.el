;;; This is where all the loading/configuration begins
;;; 
;;; Inspired by https://github.com/technomancy/emacs-starter-kit
;;; 
;;; See COPYING for licence

;;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; load path
(setq dotemacs-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3c1f0e1b78f0ecaea0468507cc3b15be6e1525b4b285e10d2e9e3cdfc0e4adf0" "5d08723b0361e6500bd914ce5e7b1933da59d831fb7d69b3ed7d1e905ce05224" "32fbec56777e19aba35fa47ccf2f6f1d8355d00efba5c5389c85fb4c36d5ece8" "6278f4223fd725ef15019bbaa44abf57fa0a6e5601941c31893c36e6b4ea2435" "218048771303933e49cf65c8333b7a44bd7f140d7c53c2ec311edba880fa0280" "498830eac3597f820791cab2d28e3e5e270f2a2f5596d3660e6a3dc188aa1bba" "61240c08e41d353c7d21fa61da97c8dbd3eb0feffd55cc0bdc9f0ff0ed048274" "93451314424e9fac1473a27800b563c7b166b4f8c91400384ab5b994c846318d" "88bce56c65a570e04a01ef3908aac348448f0bb9a3922a3f595e555e8cf0705f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
