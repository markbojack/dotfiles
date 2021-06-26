;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; SET UP ======================================================================
;; setq ------------------------------------------------------------------------
(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com"
      doom-font (font-spec :family "RobotoMono Nerd Font" :size 10 :weight 'bold)
      ;doom-big-font (font-spec :family "RobotoMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "sans" :size 13)
      doom-theme 'doom-one
      display-line-numbers-type 'relative
      evil-split-window-below t
      evil-vsplit-window-right t
      ess-indent-offset 2)

(setq org-highest-priority ?A)
(setq org-lowest-priority ?E)
(setq org-default-priority ?B)

;; flyspell --------------------------------------------------------------------
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
        (add-hook hook (lambda () (flyspell-mode -1))))

(add-hook 'text-mode-hook
          (lambda ()
            (when (not (equal major-mode 'org-mode)) (flyspell-mode t))))

;; PACKAGES ====================================================================
;; MU4E ------------------------------------------------------------------------
;; help: press H on homepage
;;(mu4e t) ;; do i need this?
(use-package! mu4e
  :ensure nil
  ;:defer 20 ; Wait until 20 seconds after startup
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :config
  (setq mu4e-index-update-in-background t         ;; needed for gmail
        mu4e-get-mail-command "mbsync -a -c ~/p-dot-script/.mbsyncrc"     ;; bc i has custom .mbsyncrc
        mu4e-update-interval (* 1 60)
        mu4e-attachment-dir "~/Downloads"
        mu4e-compose-signature (concat "Mark Bojack\n" "https://github.com/markbojack\n" "Sent with mu4e from Doom Emacs\n")
        mu4e-main-buffer-hide-personal-addresses t
        ;mu4e-index-update-error-warning nil      ;; need this if you have gpg2 encrypted pass in your ~/.mbsyncrc
        ;mu4e-index-update-error-continue t
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
        mu4e-bookmarks
        '((:name "From Dad" :query "from:Bojack" :key ?u :hide t)
          (:name "Today's messages" :query "date:today..now" :key ?t :hide t))))

;; SMTPMAIL --------------------------------------------------------------------
(use-package! smtpmail
  :config
  (setq starttls-use-gnutls t
        smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
        smtpmail-auth-credentials '(("smtp.gmail.com" 587 "markbojack.si@gmail.com" nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587))

;; ORG -------------------------------------------------------------------------
(setq org-link-search-must-match-exact-headline nil)    ;; target words with a link
(setq org-directory "~/Documents/org/")

;; ORG SUPER AGENDA ------------------------------------------------------------
;; https://github.com/alphapapa/org-super-agenda
;(use-package! org-super-agenda
  ;:after org-agenda     ;; you can also do (after! org-agenda (setq ... ))
  ;:init
  ;(setq org-super-agenda-groups '((:name "Today"
                                   ;:time-grid t
                                   ;:scheduled today)
                                  ;(:name "Due today"
                                   ;:deadline today)
                                  ;(:name "Important"
                                   ;:priority "A")
                                  ;(:name "Overdue"
                                   ;:deadline past)
                                  ;(:name "Due soon"
                                   ;:deadline future)
                                  ;(:name "Big Outcomes"
                                   ;:tag "bo")))
  ;:config
  ;(org-super-agenda-mode))

;(add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)
;(add-hook! 'org-mode-hook (company-mode -1))
;(add-hook! 'org-capture-mode-hook (company-mode -1))
(setq org-agenda-files '("~/Documents/org/remind.org"))
;;(setq org-agenda-files (directory-files-recursively "~/Documents/org/" "\.org$"))
;
;(setq org-ellipsis " ▾ "
      ;org-bullets-bullet-list '("·")
      ;org-tags-column -80
      ;org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
      ;org-log-done 'time
      ;org-refile-targets (quote ((nil :maxlevel . 1)))
      ;org-agenda-skip-scheduled-if-done t
      ;org-tags-column -80)
      ;;org-capture-templates '(("x" "Note" entry
                               ;;(file+olp+datetree "journal.org")
                               ;;"**** [ ] %U %?" :prepend t :kill-buffer t)
                              ;;("t" "Task" entry
                               ;;(file+headline "tasks.org" "Inbox")
                               ;;"* [ ] %?\n%i" :prepend t :kill-buffer t)))
;
;(after! org
  ;(set-face-attribute 'org-link nil
                      ;:weight 'normal
                      ;:background nil)
  ;(set-face-attribute 'org-code nil
                      ;:foreground "#a9a1e1"
                      ;:background nil)
  ;(set-face-attribute 'org-date nil
                      ;:foreground "#5B6268"
                      ;:background nil)
  ;(set-face-attribute 'org-level-1 nil
                      ;:foreground "steelblue2"
                      ;:background nil
                      ;:height 1.2
                      ;:weight 'normal)
  ;(set-face-attribute 'org-level-2 nil
                      ;:foreground "slategray2"
                      ;:background nil
                      ;:height 1.0
                      ;:weight 'normal)
  ;(set-face-attribute 'org-level-3 nil
                      ;:foreground "SkyBlue2"
                      ;:background nil
                      ;:height 1.0
                      ;:weight 'normal)
  ;(set-face-attribute 'org-level-4 nil
                      ;:foreground "DodgerBlue2"
                      ;:background nil
                      ;:height 1.0
                      ;:weight 'normal)
  ;(set-face-attribute 'org-level-5 nil
                      ;:weight 'normal)
  ;(set-face-attribute 'org-level-6 nil
                      ;:weight 'normal)
  ;(set-face-attribute 'org-document-title nil
                      ;:foreground "SlateGray1"
                      ;:background nil
                      ;:height 1.75
                      ;:weight 'bold)

(use-package org-fancy-priorities
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  ;;:config (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))
  :config (setq org-fancy-priorities-list '("" "" "" "")))  ; do same icon with diff colors

(map! :desc "Create Sparse Tree" :ne "SPC / s" #'org-sparse-tree)
(map! :desc "Create Sparse Tree for Tags" :ne "SPC / t" #'org-tags-sparse-tree)
(map! :ne "M-/" #'comment-or-uncomment-region)
(map! :ne "SPC n r" #'deadgrep)
(map! :ne "SPC n b" #'org-brain-visualize)
(map! :ne "SPC n p" #'counsel-org-capture)

;(setq +org-capture-todo-file "tasks.org")
;(set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
;(set-popup-rule! "^CAPTURE.*\\.org$" :side 'bottom :size 0.90 :select t :ttl nil)
;(set-popup-rule! "^\\*org-brain" :side 'right :size 1.00 :select t :ttl nil)
;(setq org-agenda-skip-scheduled-if-done t
      ;org-priority-faces '((65 :foreground "#e45649") ; 65 in ASCII is A, etc or type ?A, ?B, etc
                           ;(66 :foreground "#da8548")
                           ;(67 :foreground "#0098dd")))

;;https://github.com/Kungsgeten/org-brain
(use-package org-brain
  :ensure t
  :init
  (with-eval-after-load 'evil
    (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  :config
  (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil))

;; Allows you to edit entries directly from org-brain-visualize
(use-package polymode
  :config
  (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode))



;; NOTES =======================================================================

; How do I maximize/fullscreen Emacs on startup?
; #+BEGIN_SRC elisp
; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
; #+END_SRC
;
; Some window managers may not understand/work with =maximized= (or may not
; produce the desired effect), in that case try ~fullboth~ or ~fullscreen~.

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
