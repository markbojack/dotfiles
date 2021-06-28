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
              tab-always-indent 'complete            ; Tab indents first then tries completions
              tab-width 4                            ; Smaller width for tab characters
              uniquify-buffer-name-style 'forward    ; Better than filename<2> for same-name buffers
              window-combination-resize t            ; Take new window space from all windows (not just current)
              x-stretch-cursor t)                    ; Stretch cursor to the glyph width
;; setq-default:1 ends here

;; [[file:config.org::*setq][setq:1]]
(setq doom-theme 'doom-one
      display-line-numbers-type 'relative
      evil-split-window-below t
      evil-vsplit-window-right t
      auto-save-default t
      make-backup-files t
      ess-indent-offset 2
      confirm-kill-emacs nil
      undo-limit 80000000)
;; setq:1 ends here

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

;; [[file:config.org::*Mappings][Mappings:1]]
(map! :desc "Create Sparse Tree" :ne "SPC / s" #'org-sparse-tree)
(map! :desc "Create Sparse Tree for Tags" :ne "SPC / t" #'org-tags-sparse-tree)
(map! :ne "M-/" #'comment-or-uncomment-region)
(map! :ne "SPC n r" #'deadgrep)
(map! :ne "SPC n b" #'org-brain-visualize)
(map! :ne "SPC n p" #'counsel-org-capture)
;; Mappings:1 ends here

;; [[file:config.org::*Personal Information][Personal Information:1]]
(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com")
;; Personal Information:1 ends here

;; [[file:config.org::*Speed][Speed:1]]
;;; config.el -*- lexical-binding: t; -*-
;; Speed:1 ends here

;; [[file:config.org::*Speed][Speed:2]]
(setq gc-cons-threshold (* 8 1024 1024))
;; Speed:2 ends here

;; [[file:config.org::*Spelling][Spelling:1]]
(remove-hook 'text-mode-hook #'spell-fu-mode)
(add-hook 'markdown-mode-hook #'spell-fu-mode)
;; Spelling:1 ends here
