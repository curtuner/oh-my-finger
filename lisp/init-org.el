(require 'org)
(require 'ox-latex)
(setq org-src-fontify-natively t)
;; ditaa的位置必要时修改
(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa.jar")

;; 添加代码块支持的语言

;; 预览图像
;(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

;; blog
;(require 'ox-publish)
;(require 'org-octopress)
;(setq org-octopress-directory-top       "~/blogtune/source/")
;(setq org-octopress-directory-posts     "~/blogtune/source/_posts/")
;(setq org-octopress-directory-org-top   "~/blogtune/source")
;(setq org-octopress-directory-org-posts "~/blogtune/source/org_posts/")
					;(setq org-octopress-setup-file          "~/blogtune/setupfile.org")


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (python . t)
   (sh . t)
   (dot . t)
   (plantuml . t)))

(setq org-plantuml-jar-path
      (expand-file-name "/opt/plantuml/plantuml.jar"))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; agenda
(setq org-agenda-files (list "~/daily.org"
			     "~/Work/topsec/"
			     "~/Notes/"))





(defun my-org-inline-css-hook (exporter)
  "Insert custom inline css"
  (when (eq exporter 'html)
    (let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
           (path (concat dir "style.css"))
           (homestyle (or (null dir) (null (file-exists-p path))))
           (final (if homestyle "~/.emacs.d/org-style.css" path))) ;; <- set your own style file path
      (setq org-html-head-include-default-style nil)
      (setq org-html-head (concat
                           "<style type=\"text/css\">\n"
                           "<!--/*--><![CDATA[/*><!--*/\n"
                           (with-temp-buffer
                             (insert-file-contents final)
                             (buffer-string))
                           "/*]]>*/-->\n"
                           "</style>\n")))))

;(add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)



;; the setting of export latex or pdf
(setq org-latex-pdf-process
      '("xelatex -8bit -interaction nonstopmode -shell-escape -output-directory %o %f"
        "xelatex -8bit -interaction nonstopmode -shell-escape -output-directory %o %f"
        "xelatex -8bit -interaction nonstopmode -shell-escape -output-directory %o %f"))

(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-export-headline-levels 10)


(provide 'init-org)
