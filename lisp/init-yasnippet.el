(require-package 'yasnippet-snippets)
(setq my-yasnippets (expand-file-name "~/my-yasnippets"))

(if (and  (file-exists-p my-yasnippets) (not (member my-yasnippets yas-snippet-dirs)))
    (add-to-list 'yas-snippet-dirs my-yasnippets))

;(yas-reload-all)

(autoload 'snippet-mode "yasnippet" "")

(yas-global-mode 1)


(global-set-key "\C-o" 'aya-open-line)

(defun aya-open-line ()
  "Call `open-line', unless there are abbrevs or snippets at point.
In that case expand them.  If there's a snippet expansion in progress,
move to the next field. Call `open-line' if nothing else applies."
  (interactive)
  (cond ((expand-abbrev))

        ((yas--snippets-at-point)
         (yas-next-field-or-maybe-expand))

        ((ignore-errors
           (yas-expand)))

        (t
         (open-line 1))))


;(eval-after-load 'yasnippet'(progn(define-key yas-keymap  [tab] nil)))


(provide 'init-yasnippet)
