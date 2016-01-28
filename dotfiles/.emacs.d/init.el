;; -*- mode: emacs-lisp -*
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 0) ; IMPORTANT FOR CYGWIN
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))) t)
 '(diff-added ((t (:foreground "cyan"))) t)
 '(flymake-errline ((((class color) (background light)) (:background "Red"))) t)
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))) t)
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))) t)
 '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
;(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-hober)
;;(require 'color-theme-solarized)
;;(color-theme-solarized-dark)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark)))

;; Shift+arrow key support in screen
(define-key global-map "\e[1;4D" (kbd "M-S-<left>"))
(define-key global-map "\e[1;4C" (kbd "M-S-<right>"))
(define-key global-map "\e[1;4A" (kbd "M-S-<up>"))
(define-key global-map "\e[1;4B" (kbd "M-S-<down>"))

(define-key global-map "\e[1;2D" (kbd "S-<left>"))
(define-key global-map "\e[1;2C" (kbd "S-<right>"))
(define-key global-map "\e[1;2A" (kbd "S-<up>"))
(define-key global-map "\e[1;2B" (kbd "S-<down>"))

;; C-Home, C-End (+Shift)
(define-key global-map "\e[1;5F" (kbd "C-<end>"))
(define-key global-map "\e[1;5H" (kbd "C-<home>"))
(define-key global-map "\e[1;6F" (kbd "C-S-<end>"))
(define-key global-map "\e[1;6H" (kbd "C-S-<home>"))

;; C-Left, C-Right (+Shift)
(define-key global-map "\e[1;5C" (kbd "M-f"))
(define-key global-map "\e[1;5D" (kbd "M-b"))
(define-key global-map "\e[1;6C" (kbd "M-S-f"))
(define-key global-map "\e[1;6D" (kbd "M-S-b"))

;; C-Up, C-Down
(global-set-key (kbd "\e[1;5A") 'backward-paragraph)
(global-set-key (kbd "\e[1;5B") 'forward-paragraph)

;; Page-Up, Page-Down
(global-set-key (kbd "\e[1;5~") 'scroll-up)
(global-set-key (kbd "\e[1;6~") 'scroll-down)
