(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

(setq Tex-output-view-style
      (quote (("^pdf$" "." "evince &o %(outpage)"))))
(add-hook 'LaTeX-mode-hook (lambda()
			     (add-to-list 'TeX-command-list '("XeLaTeX" "xelatex -8bit -interaction=nonstopmode -shell-escape %t" TeX-run-TeX nil t))
			     (setq TeX-command-default "XeLaTeX")
			     (setq TeX-save-query  nil )))



(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;(company-auctex-init)

(provide 'init-latex)
