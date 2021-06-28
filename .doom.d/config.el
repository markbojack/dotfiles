;;; config.el -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 8 1024 1024))

(map! :desc "Create Sparse Tree" :ne "SPC / s" #'org-sparse-tree)
(map! :desc "Create Sparse Tree for Tags" :ne "SPC / t" #'org-tags-sparse-tree)
(map! :ne "M-/" #'comment-or-uncomment-region)
(map! :ne "SPC n r" #'deadgrep)
(map! :ne "SPC n b" #'org-brain-visualize)
(map! :ne "SPC n p" #'counsel-org-capture)

(setq user-full-name "Mark Bojack"
      user-mail-address "markbojack.si@gmail.com")

(setq doom-font (font-spec :family "RobotoMono Nerd Font" :size 10 :weight 'bold)
      ;doom-big-font (font-spec :family "RobotoMono Nerd Font" :size 14))
      doom-variable-pitch-font (font-spec :family "sans" :size 13)
      doom-theme 'doom-one
      display-line-numbers-type 'relative
      evil-split-window-below t
      evil-vsplit-window-right t
      ess-indent-offset 2
      auto-save-default t
      make-backup-files t
      confirm-kill-emacs nil)
