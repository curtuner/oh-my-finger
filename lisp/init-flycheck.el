(require 'flycheck)

;(eval-after-load 'flycheck
;  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-idle-change-delay 0.8)
(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/opt/cuda/include")))))


(provide 'init-flycheck)

