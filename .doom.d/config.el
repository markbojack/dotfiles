;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "RobotoMono Nerd Font" :size 10 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "sans" :size 13)
      doom-theme 'doom-one
      org-directory "~/Documents/org/"
      display-line-numbers-type 'relative
      evil-split-window-below t
      evil-vsplit-window-right t)

;; spelling in text files only if text-mode-hook changed to 1
;; originally flyspell-mode
;; (dolist (hook '(text-mode-hook))
        ;; (add-hook hook (lambda () (ispell-mode nil))))
;; (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
        ;; (add-hook hook (lambda () (flyspell-overlay nil))))

(add-hook 'text-mode-hook (lambda () (flyspell-mode -1)))

;; PACKAGES ====================================================================
;; MU4E ------------------------------------------------------------------------
(add-load-path! "/usr/local/share/emacs/site-lisp/mu4e")
(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com"
      mu4e-index-update-in-background t         ;; needed for gmail
      mu4e-get-mail-command "mbsync -a -c ~/p-dot-script/.mbsyncrc"     ;; bc i has custom .mbsyncrc
      mu4e-maildir "~/Mail"
      mu4e-attachment-dir "~/Downloads"
      mu4e-compose-signature (concat "Mark Bojack\n" "https://github.com/markbojack\n" "Sent with mu4e from Doom Emacs\n")
      mu4e-main-buffer-hide-personal-addresses t
      mu4e-drafts-folder "/[Gmail]/Drafts"
      mu4e-sent-folder   "/[Gmail]/Sent Mail"
      mu4e-refile-folder "/[Gmail]/All Mail"
      mu4e-trash-folder  "/[Gmail]/Trash"
      mu4e-maildir-shortcuts
        '((:maildir "/Inbox"    :key ?i)
          (:maildir "/[Gmail]/Sent Mail" :key ?s)
          (:maildir "/[Gmail]/Trash"     :key ?t)
          (:maildir "/[Gmail]/Drafts"    :key ?d)
          (:maildir "/[Gmail]/All Mail"  :key ?a))
      ;mu4e-update-interval (* 1 60)
      ;mu4e-index-update-error-warning nil      ;; need this bc you have gpg2 encrypted pass in your ~/.mbsyncrc
      ;mu4e-index-update-error-continue t
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "markbojack.si@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; ORG SUPER AGENDA ------------------------------------------------------------
;; https://github.com/alphapapa/org-super-agenda
(use-package! org-super-agenda
  :after org-agenda     ;; you can also do (after! org-agenda (setq ... ))
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                   :time-grid t
                                   :scheduled today)
                                  (:name "Due today"
                                   :deadline today)
                                  (:name "Important"
                                   :priority "A")
                                  (:name "Overdue"
                                   :deadline past)
                                  (:name "Due soon"
                                   :deadline future)
                                  (:name "Big Outcomes"
                                   :tag "bo")))
  :config
  (org-super-agenda-mode))


;; NOTES =======================================================================

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; https://github.com/hlissner/doom-emacs-private/blob/master/config.el

; How do I maximize/fullscreen Emacs on startup?
; #+BEGIN_SRC elisp
; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
; #+END_SRC
;
; Some window managers may not understand/work with =maximized= (or may not
; produce the desired effect), in that case try ~fullboth~ or ~fullscreen~.

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
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
