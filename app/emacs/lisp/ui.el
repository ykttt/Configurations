;;; ui.el -*- lexical-binding: t; -*-
(provide 'ui)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package doom-modeline-now-playing
  :after doom-modeline)

(use-package dashboard
  :init
  (setq dashboard-startup-banner 'official
        dashboard-items '((recents  . 10)
                          (projects . 5)
                          (agenda   . 5)))
  :config (dashboard-setup-startup-hook))

;; popper
(use-package popper
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "\\*Compile-Log\\*"
          help-mode
          compilation-mode
          vterm-mode))
  :config
  (popper-mode 1)
  (popper-echo-mode 1))

;; Git gutter / diff
(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (text-mode . diff-hl-mode))
  :config
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)))

(use-package hl-todo :hook (prog-mode . hl-todo-mode))
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))

(use-package column-enforce-mode :commands (column-enforce-mode))
(use-package indent-bars :hook (prog-mode . indent-bars-mode))

;; Treemacs
(use-package treemacs :commands (treemacs))
(use-package treemacs-all-the-icons :after treemacs)
(use-package treemacs-tab-bar :after treemacs)

;; Tabs
(use-package centaur-tabs
  :hook (after-init . centaur-tabs-mode)
  :custom
  (centaur-tabs-set-icons t)
  (centaur-tabs-style "bar"))

;; ewal: default theme = ewal-doom-one
(use-package ewal
  :demand t
  :init
  (setq ewal-json-file (expand-file-name "~/.cache/wal/colors.json")
        ewal-use-built-in-on-failure-p t) ; fallback
  :config
  (require 'ewal-doom-themes)

  (defvar ewal-theme-def 'ewal-doom-one)

  (defun apply-ewal-theme (&optional frame)
    (with-selected-frame (or frame (selected-frame))
      (ignore-errors (ewal-load-colors))
      (mapc #'disable-theme custom-enabled-themes)
      (load-theme ewal-theme-def t)))

  (defun reload-ewal-theme ()
    (interactive)
    (ignore-errors (ewal-load-colors))
    (apply-ewal-theme))

  (if (daemonp)
      (add-hook 'after-make-frame-functions #'apply-ewal-theme)
    (add-hook 'after-init-hook #'apply-ewal-theme))

  ;; watch colors.json
  (when (fboundp 'file-notify-add-watch)
    (let* ((f   (expand-file-name ewal-json-file))
           (dir (file-name-directory f)))
      (when (file-directory-p dir)
        (file-notify-add-watch
         dir '(change attribute-change)
         (lambda (event)
           (let ((file (nth 2 event)))
             (when (and (stringp file)
                        (string= (expand-file-name file dir) f))
               (run-with-idle-timer 0.2 nil #'reload-ewal-theme)))))))))
