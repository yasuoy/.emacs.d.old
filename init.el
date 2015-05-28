;;; パッケージの設定
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;;; splash screenを無効にする
(setq inhibit-splash-screen t)

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;;; C-u C-SPC C-SPC...でどんどん過去のマークに遡る
(setq set-mark-command-repeat-pop t)

;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)
;; filename<dir>形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;; ファイルを開いた位置を保存する
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;;; 釣合う括弧をハイライトする
(show-paren-mode 1)

;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)

;;; 現在行に色をつける
(global-hl-line-mode 1)

;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

;;; シェルに合わせるため、C-hは後退に割り当てる
(global-set-key (kbd "C-h") 'delete-backward-char)

;;; モードラインに時刻を表示する
(display-time)

;;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)

;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ログの記録行数を増やす
(setq message-log-max 10000)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;;; メニューバーとツールバーとスクロールバーを消す
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Language.
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;
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
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; Key Bindings.
;(global-set-key "\C-h" 'delete-backward-char)
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

;; Bell (turn off)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; tramp
(require 'tramp)
(setq tram-default-method "ssh")

;; w3m

;; Markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; web-mode
; (require 'web-mode)
; (add-to-list 'auto-mode-alist '("\\.liquid\\'" . web-mode))

;; Emmet
(add-to-list 'load-path "~/emacs.d/emmet-mode")
(require 'emmet-mode)

;; direx
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;; Ricty
(create-fontset-from-ascii-font "Ricty-14:weight=normal:slant=normal" nil "ricty")
(set-fontset-font "fontset-ricty"
                  'unicode
                  (font-spec :family "Ricty" :size 14)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-ricty"))

;; auto-revert
(global-auto-revert-mode 1)
