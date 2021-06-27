;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 10 1000 1000))

(map! :desc "Create Sparse Tree" :ne "SPC / s" #'org-sparse-tree)
(map! :desc "Create Sparse Tree for Tags" :ne "SPC / t" #'org-tags-sparse-tree)
(map! :ne "M-/" #'comment-or-uncomment-region)
(map! :ne "SPC n r" #'deadgrep)
(map! :ne "SPC n b" #'org-brain-visualize)
(map! :ne "SPC n p" #'counsel-org-capture)

(setq-default ad-redefinition-action 'accept         ; Silence warnings for redefinition
              auto-save-list-file-prefix nil         ; Prevent tracking for auto-saves
              cursor-in-non-selected-windows nil     ; Hide the cursor in inactive windows
              cursor-type '(hbar . 2)                ; Underline-shaped cursor
              custom-unlispify-menu-entries nil      ; Prefer kebab-case for titles
              custom-unlispify-tag-names nil         ; Prefer kebab-case for symbols
              delete-by-moving-to-trash t            ; Delete files to trash
              fill-column 80                         ; Set width for automatic line breaks
              gc-cons-threshold (* 8 1024 1024)      ; We're not using Game Boys anymore
              help-window-select t                   ; Focus new help windows when opened
              indent-tabs-mode nil                   ; Stop using tabs to indent
              inhibit-startup-screen t               ; Disable start-up screen
              initial-scratch-message ""             ; Empty the initial *scratch* buffer
              mouse-yank-at-point t                  ; Yank at point rather than pointer
              read-process-output-max (* 1024 1024)  ; Increase read size per process
              recenter-positions '(5 top bottom)     ; Set re-centering positions
              scroll-conservatively 101              ; Avoid recentering when scrolling far
              scroll-margin 2                        ; Add a margin when scrolling vertically
              select-enable-clipboard t              ; Merge system's and Emacs' clipboard
              sentence-end-double-space nil          ; Use a single space after dots
              show-help-function nil                 ; Disable help text everywhere
              tab-always-indent 'complete            ; Tab indents first then tries completions
              tab-width 4                            ; Smaller width for tab characters
              uniquify-buffer-name-style 'forward    ; Uniquify buffer names
              warning-minimum-level :error           ; Skip warning buffers
              window-combination-resize t            ; Resize windows proportionally
              x-stretch-cursor t)                    ; Stretch cursor to the glyph width

(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com"
      doom-font (font-spec :family "RobotoMono Nerd Font" :size 10 :weight 'bold)
      ;doom-big-font (font-spec :family "sans" :size 16)
      doom-variable-pitch-font (font-spec :family "sans" :size 13)
      doom-theme 'doom-one
      display-line-numbers-type 'relative
      evil-split-window-below t
      evil-vsplit-window-right t
      ess-indent-offset 2
      auto-save-default t
      make-backup-files t
      confirm-kill-emacs nil)

(blink-cursor-mode 0)                   ; Prefer a still cursor
(delete-selection-mode 1)               ; Replace region when inserting text
(fset 'yes-or-no-p 'y-or-n-p)           ; Replace yes/no prompts with y/n
(global-subword-mode 1)                 ; Iterate through CamelCase words
(mouse-avoidance-mode 'exile)           ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)    ; Enable downcase-region
(put 'upcase-region 'disabled nil)      ; Enable upcase-region
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding

(put 'add-function 'lisp-indent-function 2)
(put 'advice-add 'lisp-indent-function 2)
(put 'plist-put 'lisp-indent-function 2)

(pcase window-system
  ('w32 (set-frame-parameter nil 'fullscreen 'fullboth))
  (_ (set-frame-parameter nil 'fullscreen 'maximized)))

;; (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
        ;; (add-hook hook (lambda () (flyspell-mode -1))))
;;
;; ;; this should enable flyspell mode for all text docs but org mode
;; (add-hook 'text-mode-hook
          ;; (lambda ()
            ;; (when (not (equal major-mode 'org-mode)) (flyspell-mode t))))

;; (mu4e t) ;; do i need this?
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

(use-package! smtpmail
  :config
  (setq starttls-use-gnutls t
        smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
        smtpmail-auth-credentials '(("smtp.gmail.com" 587 "markbojack.si@gmail.com" nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587))

(setq org-babel-default-header-args:R '((:results . "output")))

(setq org-directory "~/Documents/org/"
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
                      :weight 'normal)
  (set-face-attribute 'org-level-2 nil
                      :foreground "slategray2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-3 nil
                      :foreground "SkyBlue2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-4 nil
                      :foreground "DodgerBlue2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-5 nil
                      :weight 'normal)
  (set-face-attribute 'org-level-6 nil
                      :weight 'normal)
  (set-face-attribute 'org-document-title nil
                      :foreground "SlateGray1"
                      :background nil
                      :height 1.75
                      :weight 'bold)

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

(use-package org-fancy-priorities
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  ;; :config (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))
  :config (setq org-fancy-priorities-list '("" "" "")))      ;; the same icon with diff colors looks nice too

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
  (set-popup-rule! "^\\*org-brain" :side 'right :size 1.00 :select t :ttl nil)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil))
