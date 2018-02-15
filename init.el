;; init.el

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-elpa)
;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
	  (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))


;; 备份文件
(setq backup-directory-alist (quote (("." . "~/.emacs_backup"))))

(setq auto-save-file-name-transforms
      `((".*" "~/.emacs_autosave/" t)))

;; 启动设置
(package-initialize)
;;(require 'init-ivy)
(require 'init-gui-frames)

(require 'init-themes)
(require 'init-sh)
(require 'init-editing-utils)
(require 'init-company)
(require 'init-elisp)
(require 'init-fonts)
(require 'init-windows)
(require 'init-latex)
(require 'init-flycheck)
(require 'init-yasnippet)
;(require 'init-irony)
(require 'init-python-mode)
(require 'init-utils)
(require 'init-rust-mode)
(require 'init-ocaml-mode)
(require 'init-racket)
(require 'init-helm-mode)
(require 'init-rtags)
(require 'init-scheme-mode)
(require 'init-eldoc)
(require 'init-haskell-mode)
(require 'init-cuda-mode)
(require 'init-blog)
(require 'init-coq-mode)
(require 'init-helm-gtags)
;(require 'init-mu4e)
(require 'init-eshell)
(require 'init-c-mode)
(require 'init-web-mode)
(require 'init-js-mode)
(require 'init-org)

(which-key-mode)
(defun tf-toggle-show-trailing-whitespace ()
  "Toggle show-trailing-whitespace between t and nil"
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))

;; proof general
;;(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; 邮箱
(autoload 'wl "wl" "Wanderlust" t)

(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))


(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
	(concat
	 (make-temp-name
	  (concat (file-name-nondirectory (file-name-sans-extension buffer-file-name))
		  "/"
		  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
					; take screenshot
  (if (eq system-type 'darwin)
      (progn
	(call-process-shell-command "screencapture" nil nil nil nil " -s " (concat
									    "\"" filename "\"" ))
	(call-process-shell-command "convert" nil nil nil nil (concat "\"" filename "\" -resize  \"50%\"" ) (concat "\"" filename "\"" ))
	))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
					; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "#+attr_html: :width 800\n" "[[file:" filename "]]")))
  ;; (org-display-inline-images)
  )

(load-library "url-handlers")
;; 测试
(defun initel ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(provide 'init)

(defun change-shell-mode-coding ()
  (interactive)
  (set-terminal-coding-system 'gbk)
  (set-keyboard-coding-system 'gbk)
  (set-selection-coding-system 'gbk)
  (set-buffer-file-coding-system 'gbk)
  (set-file-name-coding-system 'gbk)
  (modify-coding-system-alist 'process "*" 'gbk)
  (set-buffer-process-coding-system 'gbk 'gbk)
  (set-file-name-coding-system 'gbk))

(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(ecb-options-version "2.50")
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(org-latex-classes
   (quote
    (("article" "\\documentclass[fontset=windows,11pt]{ctexart}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t)
     ("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000"
     ("" "listings" nil))))
 '(package-selected-packages
   (quote
    (js2-refactor company-tern skewer-mode indium dockerfile-mode tornado-template-mode company-glsl glsl-mode company-irony company-irony-c-headers flycheck-irony blank-mode helm-ack helm-ad helm-google helm helm-company simple-httpd js2-mode ein helm-tramp function-args cmake-ide dired+ multiple-cursors flycheck-plantuml plantuml-mode mu4e-alert mu4e-maildirs-extension flycheck-rtags helm-projectile iedit company-anaconda company-jedi graphviz-dot-mode ob-ipython ctable epic org-ref company-coq helm-swoop helm-ag wanderlust nhexl-mode ace-jump-mode bing-dict helm-ls-svn helm-git-files helm-git-grep python-mode blog-admin cmake-mode helm-smex ecb scheme-complete c-eldoc nasm-mode magit flycheck fcitx window-numbering smex paredit matlab-mode markdown-mode lua-mode llvm-mode helm-gtags flycheck-rust flycheck-ocaml evil disable-mouse company-racer company-math company-c-headers company-auctex color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cargo bison-mode autodisass-llvm-bitcode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
