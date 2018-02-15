(setq rtags-rdm-includes "/usr/lib/gcc/x86_64-pc-linux-gnu/6.3.1/include")
(require-package 'rtags)
(require 'flycheck)
(require 'company-rtags)
(require 'flycheck-rtags)


(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
;(rtags-enable-standard-keybindings)

(setq rtags-display-result-backend 'helm)

(setq password-cache-expiry nil)

(setq rtags-tramp-enabled t)

(provide 'init-rtags)
