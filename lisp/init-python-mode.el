
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(setq elpy-rpc-backend "jedi")
(setq python-shell-completion-native-enable nil)

;(defun my/python-mode-hook () (add-to-list 'company-backends 'company-jedi))

;(add-hook 'python-mode-hook 'my/python-mode-hook)

(defun my-elpy-setting ()
  (local-set-key (kbd "M-.") 'xref-find-definitions)
  (local-set-key (kbd "M-[") 'xref-pop-marker-stack)
  (local-set-key (kbd "C-c r") 'xref-find-references))

(add-hook 'python-mode-hook 'my-elpy-setting)


(provide 'init-python-mode)
