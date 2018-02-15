;; 花括号自动换行
(when (fboundp 'electric-pair-mode)
(electric-pair-mode))
(when (eval-when-compile (version< "24.4" emacs-version))
(electric-indent-mode 1))

(defun my-c++-mode-hook ()
  "Hook for c++ mode"
  (setq irony-additional-clang-options '("-std=c++14"))
  (setq flycheck-clang-language-standard "c++14")
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace [0])
  )

(setq c-basic-offset 4)
(defun my-c-mode-hook ()
  "add rtags support"
  (setq flycheck-clang-language-standard "gnu11")
  (c-set-style "stroustrup")
  )

(defun my-rtags-hook ()
  (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
  (local-set-key (kbd "C-c r") 'rtags-find-symbol)
  (local-set-key (kbd "M-r") 'rtags-find-references)
  (local-set-key (kbd "C-c i") 'rtags-imenu)
  (local-set-key (kbd "M-]") 'rtags-location-stack-forward)
  (local-set-key (kbd "M-[") 'rtags-location-stack-back)
  )




(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'my-rtags-hook)
(add-hook 'c++-mode-hook 'my-rtags-hook)
(add-hook 'rtags-after-save-hook 'rtags-quit-rdm)

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; add more keywords in c++-mode
(font-lock-add-keywords 'c++-mode
                        '(("constexpr" . 'font-lock-keyword-face)))



(provide 'init-c-mode)
