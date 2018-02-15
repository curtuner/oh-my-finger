(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0)



(global-set-key (kbd "C-c d") 'bing-dict-brief)
(global-set-key (kbd "C-c o") 'company-complete-common)

(provide 'init-company)
