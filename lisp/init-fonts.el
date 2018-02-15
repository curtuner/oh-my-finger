;; 中文与外文字体设置
;; 英文字体

(set-default-font "Dejavu Sans Mono 9")
;; 中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "WenQuanyi Micro Hei Mono" :size 14)))

(provide 'init-fonts)
