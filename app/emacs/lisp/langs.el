;;; langs.el -*- lexical-binding: t; -*-
(provide 'langs)

;; Tree-sitter auto-switch major-mode
(use-package treesit-auto
  :custom (treesit-auto-install nil)
  :config (global-treesit-auto-mode 1))

;; Folding
(use-package hideshow
  :ensure nil
  :hook (prog-mode . hs-minor-mode))

;; Magit / Forge / vterm
(use-package magit :commands (magit-status))
(use-package forge :after magit)
(use-package vterm :commands (vterm))

;; LaTeX: AUCTeX + latexmk + cdlatex + pdf-tools
(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . TeX-source-correlate-mode)
         (LaTeX-mode . TeX-PDF-mode)
         (LaTeX-mode . visual-line-mode))
  :custom
  (TeX-source-correlate-start-server t)
  (TeX-view-program-selection '((output-pdf "PDF Tools"))))

(use-package auctex-latexmk
  :after tex
  :config (auctex-latexmk-setup))

(use-package cdlatex :hook (LaTeX-mode . cdlatex-mode))

(use-package pdf-tools
  :init (pdf-tools-install))

;; consult-tex
(use-package consult-tex
  :after (consult tex)
  :commands (consult-tex))

;; Haskell
(use-package haskell-mode :mode "\\.hs\\'")
(use-package lsp-haskell :after (lsp-mode haskell-mode))

;; Python formatting
(use-package py-isort
  :hook (python-mode . (lambda ()
                         (add-hook 'before-save-hook #'py-isort-before-save nil t))))
