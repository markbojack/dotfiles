;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "Mark Bojack"
;;      user-mail-address "markbojack.si@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;        doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 10 :weight 'light)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans Mono" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; (setq doom-theme 'doom-palenight)
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(setq user-mail-address "markbojack.si@gmail.com"
      user-full-name  "Mark Bojack"
	  mu4e-compose-signature (concat "Foo X. Bar\n" "http://www.example.com\n")
      mu4e-update-interval (* 10 60)
      mu4e-get-mail-command "mbsync -a"
	  mu4e-maildir "~/Mail"
      mu4e-main-buffer-hide-personal-addresses t
	  mu4e-change-filenames-when-moving t
	  mu4e-drafts-folder "/[Gmail]/Drafts"
	  mu4e-sent-folder   "/[Gmail]/Sent Mail"
	  mu4e-refile-folder "/[Gmail]/All Mail"
	  mu4e-trash-folder  "/[Gmail]/Trash")

(setq mu4e-maildir-shortcuts
    '((:maildir "/Inbox"    :key ?i)
      (:maildir "/[Gmail]/Sent Mail" :key ?s)
      (:maildir "/[Gmail]/Trash"     :key ?t)
      (:maildir "/[Gmail]/Drafts"    :key ?d)
      (:maildir "/[Gmail]/All Mail"  :key ?a)))

(setq message-send-mail-function 'smtpmail-send-it
   starttls-use-gnutls t
   smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
   smtpmail-auth-credentials
     '(("smtp.gmail.com" 587 "markbojack.si@gmail.com" nil))
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587)
