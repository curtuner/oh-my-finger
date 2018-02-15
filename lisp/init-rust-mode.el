(require 'smartparens-config)
(require-package 'rust-mode)
(require-package 'flycheck-rust)
(require-package 'cargo)

(require-package 'racer)
(require-package 'company-racer)


(setq racer-cmd "~/.cargo/bin/racer")
(setq racer-rust-src-path "~/.rust/src/")
(sp-local-pair 'rust-mode "'" nil :actions nil)
(sp-local-pair 'racer-mode "'" nil :actions nil)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'smartparens-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)


(provide 'init-rust-mode)
