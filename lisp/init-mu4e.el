(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq mu4e-maildir "~/.Maildir/Topsec")

(setq mu4e-drafts-folder "/[Topsec].Drafts")
(setq mu4e-sent-folder   "/[Topsec].Sent Mail")
(setq mu4e-trash-folder  "/[Topsec].Trash")

(setq mu4e-sent-messages-behavior 'delete)

;(setq mu4e-get-mail-command "offlineimap")


(setq
 user-mail-address "chen_chujun@topsec.com.cn"
 user-full-name  "chen_chujun"
 message-signature
 (concat
  "Email: chen_chujun@topsec.com.cn\n"
  "Blog: curtuner.org\n"
  "\n"))



(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      starttls-use-gnutls t)
;; Personal info
(setq user-full-name "chen_chujun")          ; FIXME: add your info here
(setq user-mail-address "chen_chujun@topsec.com.cn"); FIXME: add your info here
;; gmail setup
(setq smtpmail-smtp-server "192.168.66.9")
(setq smtpmail-smtp-service 587)
(setq smtpmail-smtp-user "chen_chujun@topsec.com.cn") ; FIXME: add your gmail addr here

(setq mu4e-compose-signature "Sent from my emacs.")

;; 显示图片
(setq mu4e-view-show-images t)

(provide 'init-mu4e)
