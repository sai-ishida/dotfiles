;;; package --- Sumarry  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 'package)
;; package-archivesを上書き
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

;; 初期化
(package-initialize)

;;install pakages which are not installed
;;this message is written by laptop

;;do not make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;show line numbers
(global-linum-mode t)

;;fullscreen
(toggle-frame-maximized)

;;C-\ で日本語入力
;;show file path
(setq frame-title-format "%f")

;;short cuts
(define-key global-map (kbd "C-t") 'other-window)

;;;;;;;;;;;
;;;;ivy;;;;
;;;;;;;;;;;
(require 'ivy)
(setq ivy-truncate-lines nil)
(setq ivy-wrap t)
;;activate
(ivy-mode 1)

;;;;;;;;;;;;;;
;;;;swiper;;;;
;;;;;;;;;;;;;;
(require 'swiper)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-s M-s") 'swiper-thing-at-point)

;;;;;;;;;;;;;;;
;;;;counsel;;;;
;;;;;;;;;;;;;;;
(require 'counsel)
;; キーバインドは一例です．好みに変えましょう．
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-M-z") 'counsel-fzf)
(global-set-key (kbd "C-M-r") 'counsel-recentf)
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
(global-set-key (kbd "C-M-f") 'counsel-ag)
(counsel-mode 1)

;;;;;;;;;;;;;;;;
;;;;flycheck;;;;
;;;;;;;;;;;;;;;;
(require 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)

;;;;;;;;;;;;;;;
;;;;flymake;;;;
;;;;;;;;;;;;;;;
;;(require 'flymake)
;;(add-hook 'prog-mode-hook 'flymake-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;flycheck-popup-tip;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'flycheck-popup-tip)
;;(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)

;;;;;;;;;;;;;;
;;;;beacon;;;;
;;;;;;;;;;;;;;
;;かーそるにえふぇくとを付ける
(require 'beacon)
(beacon-mode 1)


;;;;;;;;;;;;;;;;;
;;;;undo-tree;;;;
;;;;;;;;;;;;;;;;
;;C-x u
;;f,bで木を入れ替える
(require 'undo-tree)
(global-undo-tree-mode)

;;;;;;;;;;;;;;;;;;;
;;;;smartparens;;;;
;;;;;;;;;;;;;;;;;;;
;;(require 'smartparens)
;;綴じ括弧を自動生成
(electric-pair-mode 1)

;;;;;;;;;;;;;;;;;;;;
;;;;company-mode;;;;
;;;;;;;;;;;;;;;;;;;;
(require 'company)
(global-company-mode t)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(setq completion-ignore-case t)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
;;(setq company-backends '(company-capf))


;;;;;;;;;;;;;;;;
;;;;lsp-mode;;;;
;;;;;;;;;;;;;;;;
(require 'lsp-mode)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-completion-provider :capf)
;;assigment to free variables?
(setq lsp-idle-delay 0.500)

;;;;;;;;;;;;;;
;;;;lsp-ui;;;;
;;;;;;;;;;;;;;
(require 'lsp-ui)
(setq lsp-ui-imenu-enable t)
(setq lsp-headerline-breadcrumb-enable t)

;;;;;;;;;;;;;;;;;;;
;;;;lsp-pyright;;;;
;;;;;;;;;;;;;;;;;;;
(require 'lsp-pyright)
(add-hook 'python-mode-hook #'lsp)

;;;;clangd;;;;;
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)



;;;;;;;;;;;;;;;;;;
;;;;lsp-metals;;;;
;;;;;;;;;;;;;;;;;;
(require 'lsp-metals)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;rainbow-delimiters;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;
;;;;git;;;;
;;;;;;;;;;;
(require 'git)

;;;;;;;;;;;;;;;;;;;;;;
;;;;symbol-overlay;;;;
;;;;;;;;;;;;;;;;;;;;;;
(require 'symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)
(add-hook 'markdown-mode-hook #'symbol-overlay-mode)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(define-key symbol-overlay-map (kbd "p") 'symbol-overlay-jump-prev) ;; 次のシンボルへ
(define-key symbol-overlay-map (kbd "n") 'symbol-overlay-jump-next) ;; 前のシンボルへ
(define-key symbol-overlay-map (kbd "C-g") 'symbol-overlay-remove-all) ;; ハイライトキャンセル


;;;;;;;;;;;;;;;;;
;;;;dumb-jump;;;;
;;;;;;;;;;;;;;;;;
(require 'dumb-jump)
(setq dumb-jump-mode t)
(setq dumb-jump-selector 'ivy) ;; 候補選択をivyに任せます
(setq dumb-jump-use-visible-window nil)
(define-key global-map [(super d)] 'dumb-jump-go) ;; go-to-definition!
(define-key global-map [(super shift d)] 'dumb-jump-back)

;;;;;;;;;;;;;;;;;;;;;;
;;;interface and ui;;;
;;;;;;;;;;;;;;;;;;;;;;

(set-face-background 'default "#ccd6ff")

;;powerline
(require 'powerline)
(powerline-default-theme)
(set-face-attribute 'mode-line nil
                    :foreground "#ab951d"
                    :background "#FFd900"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#ab951d"
                    :background "#333c5e"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "#ab951d"
                    :background "#FFF100"
                    :inherit 'mode-line)


;;elscreen
(require 'elscreen)
(elscreen-start)
(global-set-key (kbd "s-t") 'elscreen-create)
(global-set-key (kbd "<f7>") 'elscreen-next)
(global-set-key (kbd "<f8>") 'elscreen-previous)
(global-set-key (kbd "s-d") 'elscreen-kill)
(set-face-attribute 'elscreen-tab-background-face nil
                    :background "grey10"
                    :foreground "grey90")
(set-face-attribute 'elscreen-tab-control-face nil
                    :background "grey20"
                    :foreground "grey90")
(set-face-attribute 'elscreen-tab-current-screen-face nil
                    :background "grey20"
                    :foreground "grey90")
(set-face-attribute 'elscreen-tab-other-screen-face nil
                    :background "grey30"
                    :foreground "grey60")
;;; [X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; [<->]を表示しない
(setq elscreen-tab-display-control nil)
;;; タブに表示させる内容を決定
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))


;;;;;;;;;;;;;;;
;;;;neotree;;;;
;;;;;;;;;;;;;;;
(require 'neotree)
(global-set-key (kbd"<f9>") 'neotree-toggle)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elscreen neotree powerline lsp-metals use-package dumb-jump symbol-overlay beacon flycheck-popup-tip dimmer python-mode lsp-pyright taxy-magit-section git counsel swiper ivy lsp-ui rainbow-delimiters company lsp-mode smartparens undo-tree flycheck mozc)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
