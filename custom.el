;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult corfu dired-subtree eglot move-text orderless pyvenv vertico
             vterm))
 '(safe-local-variable-values
   '((eval progn
           (pyvenv-activate
            (expand-file-name ".venv" (project-root (project-current))))
           (eglot-ensure)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
