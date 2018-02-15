(add-hook 'racket-mode-hook           #'enable-paredit-mode)

(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'racket-mode-hook 'my-pretty-lambda) 

(provide 'init-racket)
