;;org-mode
;;https://orgmode.org/manual/Installation.html
;;https://orgmode.org/manual/
;;git clone https://code.orgmode.org/bzg/org-mode.git
;;make autoloads
;;Link to new org-mode version
(add-to-list 'load-path "~/github/org-mode/lisp")

(setq user-full-name "<FULLNAME>"
      user-mail-address "<EMAILADRESS>")

;;Setting up Email
;; mu --version
;; mu (mail indexer/searcher) version 1.4.15
;;git clone https://github.com/djcb/mu.git
;;sudo ./autogen.sh 
;;sudo make install
;;sudo mv /usr/bin/mu /usr/bin/mu.old
;;sudo cp mu /usr/bin
;; mu init --my-address=<EMAILADRESS>
;; mu index
(add-to-list 'load-path "~/github/mu/mu4e")

(require 'mu4e)

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

(setq 
  mu4e-sent-folder "/<EMAILADDRESS>/Sent Items"
  mu4e-drafts-folder "<EMAILADDRESS>/Drafts"
  mu4e-trash-folder "<EMAILADRESS>/Trash")

;; Then, a V opens the current message in the default web browsers.
(add-to-list 'mu4e-view-actions '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; enable inline images
;; https://www.djcbsoftware.nl/code/mu/mu4e/Viewing-images-inline.html
;; sudo apt-get install imagemagick
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;Reply Quote Strings
;;http://pragmaticemacs.com/category/mu4e/
;; customize the reply-quote-string
(setq message-citation-line-format "Am %a %d %b %Y um %R, schrieb %f:\n")
;; choose to use the formatted string
(setq message-citation-line-function 'message-insert-formatted-citation-line)


;; allow for updating mail using 'U' in the main view:
;; https://www.djcbsoftware.nl/code/mu/mu4e/Gmail-configuration.html
(setq mu4e-get-mail-command "mbsync -a")

;; Don't ask to quit... why is this the default?
;; http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/
;(setq mu4e-confirm-quit nil)

;;SMTP
;;https://www.tomica.net/blog/2020/12/sending-mail-using-multiple-mu4e-contexts-in-emacs/
(setq sendmail-program "/usr/bin/msmtp"
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'message-send-mail-with-sendmail)
