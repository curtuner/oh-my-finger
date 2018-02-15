(require 'helm)
(require 'helm-projectile)

(helm-mode 1)
;; 自动设置窗口大小
(helm-autoresize-mode 1)

;; 设置find-file
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; 代替默认的搜索
;(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-c s") 'helm-swoop)

;; helm-mini 代替默认的 C-x b ，显示缓冲区列表，可搜索，完全可以代替默认的缓冲区列表命令，即 C-x b/C-x C-b
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)


;;键入 C-c h i 进入，列出当前文件章节/节点列表，选择后跳转到指定章节/节点
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(global-set-key (kbd "C-c i") 'helm-semantic-or-imenu)
(global-set-key (kbd "M-x") 'helm-M-x)

;; projectile
(helm-projectile-on)
(global-set-key (kbd "C-c p") 'helm-projectile)


(provide 'init-helm-mode)
