;; [[file:config.org::*Let's get started][Let's get started:1]]
;;; config.el -*- lexical-binding: t; -*-
;; Let's get started:1 ends here

;; [[file:config.org::*setq-default][setq-default:1]]
(setq-default cursor-in-non-selected-windows nil     ; Hide the cursor in inactive windows
              custom-unlispify-menu-entries nil      ; Prefer kebab-case for titles
              custom-unlispify-tag-names nil         ; Prefer kebab-case for symbols
              delete-by-moving-to-trash t            ; Delete files to trash
              fill-column 80                         ; Set width for automatic line breaks
              help-window-select t                   ; Focus new help windows when opened
              initial-scratch-message ""             ; Empty the initial *scratch* buffer
              mouse-yank-at-point t                  ; Yank at point rather than pointer
              read-process-output-max (* 1024 1024)  ; Increase read size per process
              recenter-positions '(5 top bottom)     ; Set re-centering positions
              scroll-conservatively 101              ; Avoid recentering when scrolling far
              scroll-margin 2                        ; Add a margin when scrolling vertically
              show-help-function nil                 ; Disable help text everywhere
              tab-always-indent t
              tab-width 2                            ; Smaller width for tab characters
              uniquify-buffer-name-style 'forward    ; Better than filename<2> for same-name buffers
              window-combination-resize t            ; Take new window space from all windows (not just current)
              x-stretch-cursor t)                    ; Stretch cursor to the glyph width
;; setq-default:1 ends here

;; [[file:config.org::*setq][setq:1]]
(setq doom-theme 'doom-one
      display-line-numbers-type 'relative
      evil-split-window-below t
      evil-vsplit-window-right t
      gc-cons-threshold (* 8 1024 1024)
      auto-save-default t
      make-backup-files t
      confirm-kill-emacs nil
      ;; ess-offset-continued '(straight 4)        ;; indent after pipe, etc
      ess-indent-offset 4                       ;; indent all lines
      undo-limit 80000000
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      tab-line-mode t)
;; setq:1 ends here

;; [[file:config.org::*Miscellaneous][Miscellaneous:1]]
(fset 'yes-or-no-p 'y-or-n-p)           ; Replace yes/no prompts with y/n
(global-subword-mode t)                 ; Iterate through CamelCase words
(mouse-avoidance-mode 'exile)           ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)    ; Enable downcase-region C-x C-l
(put 'upcase-region 'disabled nil)      ; Enable upcase-region C-x C-u
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(display-time-mode 1)                             ; Enable time in the mode-line
(unless (string-match-p "^Power N/A" (battery))   ; On laptops...
  (display-battery-mode 1))                       ; it's nice to know how much power you have
;; Miscellaneous:1 ends here

;; [[file:config.org::*Font][Font:1]]
(setq doom-font (font-spec :family "RobotoMono Nerd Font" :size 10 :weight 'bold)
      ;; doom-big-font (font-spec :family "RobotoMono Nerd Font" :size 14))
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
;; Font:1 ends here

;; [[file:config.org::*Fullscreen][Fullscreen:1]]
(pcase window-system
  ('w32 (set-frame-parameter nil 'fullscreen 'fullboth))
  (_ (set-frame-parameter nil 'fullscreen 'maximized)))

;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Fullscreen:1 ends here

;; [[file:config.org::*Mappings][Mappings:1]]
(map! :desc "Create Sparse Tree" :ne "SPC / s" #'org-sparse-tree)
(map! :desc "Create Sparse Tree for Tags" :ne "SPC / t" #'org-tags-sparse-tree)
(map! :ne "M-/" #'comment-or-uncomment-region)
(map! :ne "SPC n r" #'deadgrep)
(map! :ne "SPC n b" #'org-brain-visualize)
(map! :ne "SPC n p" #'counsel-org-capture)
(map! :ne "M-u" #'mu4e-update-index)
;; Mappings:1 ends here

;; [[file:config.org::*Personal Information][Personal Information:1]]
(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com")
;; Personal Information:1 ends here

;; [[file:config.org::*Spelling][Spelling:1]]
(remove-hook 'text-mode-hook #'spell-fu-mode)
(add-hook 'markdown-mode-hook #'spell-fu-mode)
;; Spelling:1 ends here

;; [[file:config.org::*=ess/R=][=ess/R=:1]]
(setq org-babel-default-header-args:R '((:session)
                                        (:results . "output")))
(setq scroll-down-aggressively 0.01)
;; =ess/R=:1 ends here

;; [[file:config.org::*=mu4e=][=mu4e=:1]]
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")

(setq mu4e-index-update-in-background t
      mu4e-get-mail-command "mbsync -a -c ~/p-dot-script/.mbsyncrc"
      mu4e-update-interval (* 1 60)
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
      mu4e-bookmarks
      '((:name "Family" :query "from:Bojack" :key ?f :hide t)
        (:name "Today's messages" :query "date:today..now" :key ?t :hide nil)))
;; =mu4e=:1 ends here

;; [[file:config.org::*=smtpmail=][=smtpmail=:1]]
(setq starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "markbojack.si@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)
;; =smtpmail=:1 ends here

;; [[file:config.org::*=smtpmail=][=smtpmail=:2]]
;; (put 'add-function 'lisp-indent-function 4)
;; (put 'advice-add 'lisp-indent-function 4)
;; (put 'plist-put 'lisp-indent-function 4)
;; =smtpmail=:2 ends here

;; [[file:config.org::*=org=][=org=:1]]
(setq org-directory "~/Documents/org/"

      ;; org-agenda-files (directory-files-recursively "~/Documents/org/" "\.org$")  ;; make everything an agenda file
      org-agenda-files '("~/Documents/org/remind.org")
      ;; overview         top-level headlines only
      ;; content          all headlines
      ;; showall          no folding of any entries
      ;; showeverything   show even drawer contents
      org-startup-folded t
      org-link-search-must-match-exact-headline nil     ;; target words with a link
      org-highest-priority ?A
      org-default-priority ?B
      org-lowest-priority ?C                            ;; does this really have to be ?E by default?
      org-ellipsis " ▾ "
      org-bullets-bullet-list '("·")
      org-tags-column -80
      org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
      org-log-done 'time
      org-refile-targets (quote ((nil :maxlevel . 1)))
      org-tags-column -80
      org-agenda-skip-scheduled-if-done t
      org-priority-faces '((65 :foreground "#e45649")   ;; 65 in ASCII is A, etc or type ?A, ?B, etc
                           (66 :foreground "#da8548")
                           (67 :foreground "#0098dd"))
      org-capture-templates '(("x" "Note" entry
                               (file+olp+datetree "journal.org")
                               "**** [ ] %U %?" :prepend t :kill-buffer t)
                              ("t" "Task" entry
                               (file+headline "tasks.org" "Inbox")
                               "* [ ] %?\n%i" :prepend t :kill-buffer t)))

;; (add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)  ;;  i don't like this
(add-hook! 'org-mode-hook (company-mode -1))
(add-hook! 'org-capture-mode-hook (company-mode -1))

(set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
(set-popup-rule! "^CAPTURE.*\\.org$" :side 'bottom :size 0.90 :select t :ttl nil)

(after! org
  (set-face-attribute 'org-link nil
                      :weight 'normal
                      :background nil)
  (set-face-attribute 'org-code nil
                      :foreground "#a9a1e1"
                      :background nil)
  (set-face-attribute 'org-date nil
                      :foreground "#5B6268"
                      :background nil)
  (set-face-attribute 'org-level-1 nil
                      :foreground "steelblue2"
                      :background nil
                      :height 1.2
                      :weight 'bold)
  (set-face-attribute 'org-level-2 nil
                      :foreground "slategray2"
                      :background nil
                      :height 1.0
                      :weight 'bold)
  (set-face-attribute 'org-level-3 nil
                      :foreground "SkyBlue2"
                      :background nil
                      :height 1.0
                      :weight 'bold)
  (set-face-attribute 'org-level-4 nil
                      :foreground "DodgerBlue2"
                      :background nil
                      :height 1.0
                      :weight 'bold)
  (set-face-attribute 'org-level-5 nil
                      :weight 'bold)
  (set-face-attribute 'org-level-6 nil
                      :weight 'bold)
  (set-face-attribute 'org-document-title nil
                      :foreground "SlateGray1"
                      :background nil
                      :height 1.75
                      :weight 'bold))
;; =org=:1 ends here

;; [[file:config.org::*=org-super-agenda=][=org-super-agenda=:1]]
(after! org-agenda
  (setq org-super-agenda-mode t
        org-super-agenda-groups '((:name "Today"
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
                                   :tag "bo"))))
;; =org-super-agenda=:1 ends here
