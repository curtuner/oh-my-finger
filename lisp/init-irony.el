;; 主要是c/c++的设置， 这里使用irony作为名字

(require 'semantic)
(require-package 'irony)
(require-package 'company-irony)
(require-package 'company-irony-c-headers)

(setq c-basic-offset 4)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))


(add-hook 'c-mode-common-hook 'hs-minor-mode)


(add-hook 'c-mode-hook #'irony-mode)
(add-hook 'c++-mode-hook #'irony-mode)
(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'c++-mode-hook #'smartparens-mode)
(add-hook 'c++-mode-hook #'yas-minor-mode)
(add-hook 'irony-mode-hook #'irony-eldoc)



;; add keywords



;; 花括号自动换行
(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))
(when (eval-when-compile (version< "24.4" emacs-version))
  (electric-indent-mode 1))



;(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;
(defun my-c++-mode-hook ()
  "Hook for c++ mode"
  (setq irony-additional-clang-options '("-std=c++14"))
  (setq flycheck-clang-language-standard "c++14")
;  (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
;  (local-set-key (kbd "C-c r r") 'rtags-find-references)
;  (local-set-key (kbd "C-c r .") 'rtags-find-references-at-point)
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace [0])
  )

					;

(defun my-c-mode-hook ()
  "add rtags support"
  (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
  (local-set-key (kbd "C-c r r") 'rtags-find-references)
  (local-set-key (kbd "C-c r .") 'rtags-find-references-at-point)
  (setq flycheck-clang-language-standard "gnu11")
  (c-set-style "stroustrup"))

(add-hook 'c-mode-hook 'my-c-mode-hook)



(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))


(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; add more keywords in c++-mode
(font-lock-add-keywords 'c++-mode
                        '(("constexpr" . 'font-lock-keyword-face)))

(cmake-ide-setup)

(provide 'init-irony)
