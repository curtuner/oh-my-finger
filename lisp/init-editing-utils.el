;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(show-paren-mode 1)

(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))
(global-prettify-symbols-mode 1)

;; 二进制文件查看
(add-to-list 'auto-mode-alist '("\\.bin\\'" . hexl-mode))

;; 计算器
(global-set-key (kbd "C-c q") 'quick-calc)

(provide 'init-editing-utils)
