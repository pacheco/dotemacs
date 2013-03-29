(defun toggle-fullscreen ()
  "Switch to/from fullscreen"
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                         'fullboth)))

(defun toggle-maximize ()
  "Maximize (or unmaximize) window"
  (interactive)
  ;; TODO: this only works for X. patches welcome for other OSes.
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(defun previous-window ()
  "Change to previous window"
  (interactive)
  (other-window -1))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun pretty-lambdas ()
  "Change 'lambda's to the lambda symbol"
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))


(defun lps/nicer-ansi-term ()
  "Change ansi-term color to nicer ones"
  (interactive)
  (setq ansi-term-color-vector [unspecified "black" "orange red" "chartreuse" "yellow" "royal blue" "magenta" "turquoise" "white"]))


(provide 'lps-defuns)
