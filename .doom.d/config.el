;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

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

(add-load-path! "/usr/local/share/emacs/site-lisp/mu4e")

(use-package mu4e
  :ensure nil
  :ensure-system-package mu
  :custom
  (mu4e-attachment-dir "~/Downloads")
  (mu4e-change-filenames-when-moving t)
  (mu4e-confirm-quit nil)
  (mu4e-compose-dont-reply-to-self t)
  (mu4e-compose-signature-auto-include nil)
  (mu4e-drafts-folder "/gmail/Drafts")
  (mu4e-get-mail-command (format "mbsync -c '%s/isync/mbsyncrc' -a" xdg-config))
  (mu4e-html2text-command "iconv -c -t utf-8 | pandoc -f html -t plain")
  (mu4e-maildir "~/Mail")
  (mu4e-maildir-shortcuts
   '(("/[Gmail]/All Mail" . ?a)
     ("/Inbox" . ?i)
     ("/[Gmail]/Drafts" . ?D)
     ("/[Gmail]/Sent" . ?s)
     ("/[Gmail]/Trash" . ?T)))
  (mu4e-refile-folder "/[Gmail]/All Mail")
  (mu4e-sent-folder "/[Gmail]/Sent Mail")
  (mu4e-trash-folder "/[Gmail]/Trash")
  (mu4e-drafts-folder "/[Gmail]/Drafts")
  (mu4e-update-interval 60)
  (mu4e-use-fancy-chars t)
  (mu4e-view-show-addresses t)
  (mu4e-view-show-images t)
  :config
  (add-to-list 'mu4e-headers-actions '("org-contact-add" . mu4e-action-add-org-contact) t)
  (add-to-list 'mu4e-view-actions '("org-contact-add" . mu4e-action-add-org-contact) t))

(use-package mu4e-alert
  :after mu4e
  :hook ((after-init . mu4e-alert-enable-mode-line-display)
         (after-init . mu4e-alert-enable-notifications))
  :config (mu4e-alert-set-default-style 'libnotify))

(use-package message
  :ensure nil
  :custom (send-mail-function 'smtpmail-send-it))

(use-package smtpmail
  :ensure nil
  :custom
  (smtpmail-smtp-server "smtp.gmail.com")
  (smtpmail-smtp-service 587)
  (smtpmail-smtp-user "markbojack.si")
  (smtpmail-stream-type 'starttls))
