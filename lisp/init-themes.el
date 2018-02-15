(require 'color-theme)
(require-package 'color-theme-solarized)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(color-theme-solarized))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  (interactive)
  (color-theme-initialize)
  (color-theme-solarized-dark))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------

(provide 'init-themes)
