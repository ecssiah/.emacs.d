
;; --- GENERAL --- ;;

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq hscroll-margin 5)
(setq hscroll-step 1)
(setq auto-hscroll-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq-default truncate-lines t)


;; --- FUNCTIONS --- ;;

(defun jsk-no-op ()
  (interactive))

;; -- DIRED-SUBTREE -- ;;

(with-eval-after-load 'dired
  (require 'dired-subtree)
  (define-key dired-mode-map (kbd "i") #'dired-subtree-toggle))

;; --- EGLOT --- ;;

(setq eglot-inlay-hints-mode nil)

(setq
 eglot-ignored-server-capabilities
 '(:documentFormattingProvider
   :documentRangeFormattingProvider
   :documentOnTypeFormattingProvider))

(require 'eglot)

(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)

(add-hook
 'eglot-managed-mode-hook
 (lambda ()
   (eglot-inlay-hints-mode -1)))

;; --- ORDERLESS --- ;;

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)))

;; --- VERTICO --- ;;

(use-package vertico
  :init
  (vertico-mode))

;; --- CORFU --- ;;

(use-package corfu
  :init
  (global-corfu-mode)

  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-cycle t))


;; --- THEME / UI --- ;;

(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 60))

(load-theme 'modus-operandi t)

(set-face-attribute
 'default nil
 :family "Iosevka"
 :height 160
 :weight 'normal)


;; --- C STYLE --- ;;

(c-add-style
 "jsk-cstyle"
 '(
   (c-basic-offset . 4)
   (c-comment-only-line-offset . 0)

   (c-offsets-alist
    (brace-list-intro . 4)
    (brace-list-entry . 0)

    (arglist-intro . 4)
    (arglist-cont-nonempty . 4)
    (arglist-close . 0)

    (statement-block-intro . 4)
    (knr-argdecl-intro . 4)

    (statement-cont . +)
    (substatement-open . 0)
    (substatement-label . 0)

    (label . 0)
    (inline-open . 0)

    (inexpr-class . 0))))

(setq c-default-style "jsk-cstyle")

(add-hook
 'c-mode-hook
 (lambda ()
   (c-set-style "jsk-cstyle")))

(add-hook
 'c++-mode-hook
 (lambda ()
   (c-set-style "jsk-cstyle")))


;; --- KEYBINDINGS --- ;;

(global-set-key (kbd "C-.") #'completion-at-point)

(global-set-key (kbd "C-f") #'forward-word)
(global-set-key (kbd "C-b") #'backward-word)

(global-set-key (kbd "<C-wheel-up>") #'jsk-no-op)
(global-set-key (kbd "<C-wheel-down>") #'jsk-no-op)
(global-set-key (kbd "<C-mouse-4>") #'jsk-no-op)
(global-set-key (kbd "<C-mouse-5>") #'jsk-no-op)

(global-set-key (kbd "<C-magnify-up>") #'jsk-no-op)
(global-set-key (kbd "<C-magnify-down>") #'jsk-no-op)

(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C-=") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)


;; --- CUSTOM VARIABLES --- ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(corfu dired-subtree eglot orderless vertico vterm)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
