
(define-derived-mode cuda-mode c++-mode "cuda mode"
  "a mode for cuda programming"
  (flycheck-mode 0))

(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))


(provide 'init-cuda-mode)
