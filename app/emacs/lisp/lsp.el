;;; lsp.el -*- lexical-binding: t; -*-
(provide 'lsp)

(use-package flycheck :init (global-flycheck-mode 1))

(use-package consult-flycheck
  :after (consult flycheck)
  :commands (consult-flycheck))

(use-package lsp-mode
  :hook ((prog-mode . lsp-deferred)
         (LaTeX-mode . lsp-deferred))
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-use-plists t)
  ;; breadcrumb
  (add-hook 'lsp-mode-hook #'lsp-headerline-breadcrumb-mode)
  :custom
  (lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  :config
  ;; emacs-lsp-booster
  (defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
     (when (equal (following-char) ?#)
       (let ((bytecode (read (current-buffer))))
         (when (byte-code-function-p bytecode)
           (funcall bytecode))))
     (apply old-fn args)))

  (advice-add (if (progn (require 'json)
                         (fboundp 'json-parse-buffer))
                  'json-parse-buffer
                'json-read)
              :around
              #'lsp-booster--advice-json-parse)

  (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
      (if (and (not test?)
               (not (file-remote-p default-directory))
               lsp-use-plists
               (not (functionp 'json-rpc-connection))
               (executable-find "emacs-lsp-booster"))
          (progn
            (when-let ((command-from-exec-path (executable-find (car orig-result))))
              (setcar orig-result command-from-exec-path))
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))

  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command))

(use-package lsp-ui :after lsp-mode)
(use-package lsp-treemacs :after (lsp-mode treemacs)
  :config (lsp-treemacs-sync-mode 1))

(use-package dap-mode
  :after lsp-mode
  :config (dap-auto-configure-mode 1))

;; consult-lsp
(use-package consult-lsp
  :after (consult lsp-mode)
  :commands (consult-lsp-diagnostics consult-lsp-symbols consult-lsp-file-symbols))
