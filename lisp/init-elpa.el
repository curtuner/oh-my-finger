(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")

(if melpa-use-https-repo
    (setq package-archives
          '(;; uncomment below line if you need use GNU ELPA
            ("gnu" . "https://elpa.emacs-china.org/gnu/")
            ("melpa" . "https://elpa.emacs-china.org/melpa/")))
  (setq package-archives
        '(;; uncomment below line if you need use GNU ELPA
          ("gnu" . "http://elpa.emacs-china.org/gnu/")
          ("melpa" . "http://elpa.emacs-china.org/melpa/")))
  )
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
(require-package package min-version t)))))

;; If gpg cannot be found, signature checking will fail, so we
;; conditionally enable it according to whether gpg is available. We
;; re-run this check once $PATH has been configured

(setq package-enable-at-startup nil)
(package-initialize)

;; 需要的配置文件
(require-package 'color-theme)
(require-package 'lua-mode)
(require-package 'ivy)
(require-package 'smex)
(require-package 'undo-tree)
(require-package 'auctex)
(require-package 'company-auctex)
(require-package 'company-math)
(require-package 'company)
(require-package 'paredit)
(require-package 'smartparens)
(require-package 'window-numbering)
;(require-package 'org-octopress)
;(require-package 'flycheck)
(require-package 'yasnippet)
(require-package 'evil)
(require-package 'autodisass-llvm-bitcode)
(require-package 'matlab-mode)
(require-package 'markdown-mode)
(require-package 'bison-mode)
(require-package 'racket-mode)
(require-package 'helm)
(require-package 'helm-projectile)
(require-package 'helm-gtags)
(require-package 'helm-flycheck)
(require-package 'helm-rtags)
(require-package 'magit)
(require-package 'racket-mode)
(require-package 'irony)
(require-package 'company-irony)
(require-package 'company-irony-c-headers)
(require-package 'irony-eldoc)
(require-package 'flycheck-irony)
(require-package 'eldoc)
(require-package 'haskell-mode)
(require-package 'flycheck-haskell)
(require-package 'blog-admin)
(require-package 'graphviz-dot-mode)
(require-package 'which-key)
(require-package 'company-coq)
(require-package 'swoop)
(require-package 'helm-swoop)
(require-package 'idris-mode)
(require-package 'helm-idris)
(require-package 'anaconda-mode)
(require-package 'company-anaconda)
(require-package 'elpy)
(require-package 'web-mode)
(require-package 'company-rtags)
(require-package 'flycheck-rtags)
(require-package 'cmake-mode)
(require-package 'cmake-ide)
(require-package 'dockerfile-mode)
(require-package 'simple-httpd)
(require-package 'plantuml-mode)

(provide 'init-elpa)
