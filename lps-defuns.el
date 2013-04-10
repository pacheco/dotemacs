;;; lps-defuns --- misc custom functions

;;; Commentary:

;;; Code:

(defun toggle-fullscreen ()
  "Switch to/from fullscreen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                         'fullboth)))

(defun toggle-maximize ()
  "Maximize (or unmaximize) window."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun pretty-lambdas ()
  "Change 'lambda's to the lambda symbol."
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))


(defun lps/nicer-ansi-term ()
  "Change 'ansi-term' color to nicer ones."
  (interactive)
  (if (or (< emacs-major-version 24)
            (and (= emacs-major-version 24) (< emacs-minor-version 3)))
      (setq ansi-term-color-vector
            [unspecified "black" "orange red" "chartreuse" "yellow" "royal blue" "magenta" "turquoise" "white"])
    ;; i'm not sure custom-set-faces is the right way to do it... but it solves the problem
    (custom-set-faces
     '(term-color-blue ((t (:background "royal blue" :foreground "royal blue")))))))

(defun lps/ede-project-dir ()
  "Return root directory for current ede-project."
  (file-name-directory (oref (ede-current-project) :file)))

(defun lps/generate-gtags ()
  "Run gnu globals on current ede-project."
  (interactive)
  (let ((dir (if (ede-cpp-root-project-p (ede-current-project))
                 (file-name-directory (oref (ede-current-project) :file))
               (read-directory-name "Directory to run gtags in: "))))
    (cedet-gnu-global-create/update-database default-directory)))

(defun lps/shell-other-window (&optional cmd)
  "Start an 'ansi-term' the other window.
CMD is the command to execute (defaults to bash)."
  (interactive)
  (let ((thecmd (or cmd "/bin/bash"))
        (dir default-directory))
    (split-window-sensibly)
    (other-window 1)
    (let ((default-directory dir))
      (ansi-term thecmd))))

(defun lps/ipython ()
  "Start Ipython on the other window."
  (interactive)
  (lps/shell-other-window "ipython"))

(provide 'lps-defuns)

;;; lps-defuns ends here
