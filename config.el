;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zhenkai Xu"
      user-mail-address "kayfire@163.com")

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
(setq doom-font (font-spec :family "Fira Code Retina" :size 14)
      doom-variable-pitch-font (font-spec :family "ETBembo" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-zenburn)

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

(setq org-noter-notes-search-path '("~/notes"))

;; https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
(setq frame-title-format
      `((buffer-file-name "%f" "%b")
        ,(format " - Emacs %s" emacs-version)))

(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)

(setq org-superstar-item-bullet-alist
  '((?* . ?○)
    (?+ . ?◎)
    (?- . ?●)))
(setq org-superstar-bullet-list '("◉" "○" "▶" "▷"))


;; binding keys
(map! :leader
      :desc "M-x" "SPC" #'execute-extended-command
      )

;; set for packages
(use-package! graphviz-dot-mode)

(use-package! visual-regexp-steroids
  :defer 3
  :config
  (require 'pcre2el)
  (setq vr/engine 'pcre2el)
  (map! "C-c s r" #'vr/replace)
  (map! "C-c s q" #'vr/query-replace))


;; (use-package! mixed-pitch
;;   :defer
;;   :config
;;   (setq mixed-pitch-variable-pitch-cursor nil)
;;   :hook
;;   (text-mode . mixed-pitch-mode))

(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t))

;; (add-hook! org-mode :append
;;            #'visual-line-mode
;;            #'variable-pitch-mode
;;            (lambda () (add-hook 'after-save-hook 'org-babel-tangle :append :local)))
