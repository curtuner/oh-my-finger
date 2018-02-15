(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-utils)
(global-set-key [(f5)] 'compile)
(global-set-key (kbd "C-SPC") 'nil) 
(setq case-replace nil)

(defun ctest ()
  (interactive)
  (find-file "~/test/test.c"))
(provide 'init)

(require-package 'bing-dict)
(global-set-key (kbd "C-c d") 'bing-dict-brief)
