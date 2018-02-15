(require-package 'tuareg)
(require-package 'flycheck-ocaml)
(require 'smartparens-config)

(sp-local-pair 'tuareg-mode "'" nil :actions nil)
(add-hook 'tuareg-mode-hook #'smartparens-mode)

(provide 'init-ocaml-mode)
