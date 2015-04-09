;;
;; init.el
;;

;; Language.
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Package Management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(line-number-mode t)
(column-number-mode t)
(setq make-backup-files nil)

;; Theme.
;;(load-theme 'adwaita' t)
(load-theme 'misterioso' t)

 
;; fringe.
(global-linum-mode t)
(set-face-attribute 'linum nil :foreground "red" :height 1.0)
(setq linum-format "%3d")

;; helm.
(when (require 'helm-config nil t)
  (helm-mode 1))
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x b") 'helm-for-files)

;; Key Bindings.
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-z" 'dabbrev-completion)
(global-set-key (kbd "C-c r") 'query-replace)
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)


(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; Settings depend on Environment
;;; Mac
(if (eq system-type 'darwin)
    (progn
      ;; Settings for Mac Common
      (if (eq window-system 'ns)
	  (progn
	    ;; Setings for Mac GUI
	    ))
      (if (eq window-system nil)
	  (progn
	    ;; Setings for Mac CUI
	    ))
      ))
;; Linux
(if (eq system-type 'gnu/linux)
    (progn
      ;; Setting for Linux
      ))
;; Windows
(if (eq system-type 'windows-nt)
    (progn
      ;; Setting for Windows
      ))
