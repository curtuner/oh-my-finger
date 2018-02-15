(add-hook 'c-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "C-c g t") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "C-c g r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (define-key helm-gtags-mode-map (kbd "M-p") 'helm-gtags-pop-stack)
  )

(provide 'init-helm-gtags)
