;;; init.el -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file nil t))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Tree-sitter
(let ((ts (getenv "TS_GRAMMARS_DIR")))
  (when (and ts (file-directory-p ts))
    (add-to-list 'treesit-extra-load-path ts)))

(require 'use-package)
(setq use-package-always-defer t
      use-package-always-ensure nil
      use-package-expand-minimally t)

(require 'core)
(require 'completion)
(require 'ui)
(require 'keys-meow)
(require 'lsp)
(require 'org-setup)
(require 'langs)
