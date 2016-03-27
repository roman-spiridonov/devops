;; -*- mode: emacs-lisp -*
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d/lisp")
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
; (menu-bar-mode -1) ; Disables the menu on top
(normal-erase-is-backspace-mode 0) ; Cygwin compatibility for backspace
(put 'downcase-region 'disabled nil) ; Enable C-x C-d for conversion of the region to lower case
(put 'upcase-region 'disabled nil) ; Enable C-x C-u for conversion of the region to upper case
(setq column-number-mode t) ; Enable column number mode (shows column number is status bar)
(setq inhibit-startup-message t) ; Disable start screen in emacs
(setq save-abbrevs nil) ; Save abbrevs when files are saved? (https://www.emacswiki.org/emacs/AbbrevMode)
(setq show-trailing-whitespace t) 
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

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
(add-to-list 'load-path "~/.emacs.d/lisp/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; ---------------------------
;; -- Color schemes         --
;; ---------------------------
;; Solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-hober)
;;(require 'color-theme-solarized)
;;(color-theme-solarized-dark)
(custom-set-variables
 '(frame-background-mode (quote dark)))
(enable-theme 'solarized)
;; ---------------------------

;; --------------------------
;; -- Major modes          --
;; --------------------------
;; Markdown mode (*.md) https://github.com/jrblevin/markdown-mode
(add-to-list 'load-path "~/.emacs.d/lisp/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;;--------------------------

 
;; ------------------------------
;; -- GNU Screen compatibility --
;; ------------------------------
;; Shift+arrow key support 
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
;; ------------------------------

;; ------------------------------
;; -- Custom functions         --
;; ------------------------------
(defun wc ()
  "Count the words in the current buffer, show the result in the minibuffer"
  (interactive)          ; *** This is the line that you need to add
  (save-excursion 
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let ((count 0))
      (while (forward-word 1)
	(setq count(1+ count)))
      (message "There are %d words in the buffer" count)))))

;; counting functions
(defalias 'lc 'count-lines-page)
;; ------------------------------
