;;; core.el -*- lexical-binding: t; -*-
(provide 'core)

(set-language-environment "UTF-8")
(setq debug-on-message "Package cl is deprecated")
(setq ring-bell-function 'ignore
      make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 2
      auto-save-default t)

;; backups
(let ((bdir (expand-file-name "backups/" user-emacs-directory))
      (adir (expand-file-name "autosave/" user-emacs-directory)))
  (make-directory bdir t)
  (make-directory adir t)
  (setq backup-directory-alist `(("." . ,bdir))
        auto-save-file-name-transforms `((".*" ,adir t))))

;; which-key
(use-package which-key
  :init (which-key-mode 1)
  :custom (which-key-idle-delay 0.5))

;; helpful
(use-package helpful
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h x" . helpful-command)
         ("C-c C-d" . helpful-at-point)))

;; devdocs
(use-package devdocs
  :bind (("C-h D" . devdocs-lookup)))

;; tools
(use-package define-word :commands (define-word))
(use-package string-edit-at-point :commands (string-edit-at-point))
