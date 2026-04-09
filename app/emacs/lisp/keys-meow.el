;;; keys-meow.el -*- lexical-binding: t; -*-
(provide 'keys-meow)

(use-package meow
  :demand t
  :config
  (add-to-list 'meow-mode-state-list '(vterm-mode . insert))
  (add-to-list 'meow-mode-state-list '(magit-mode . motion))
  (add-to-list 'meow-mode-state-list '(helpful-mode . motion))
  (defun meow-setup ()
    ;; Motion state
    (meow-motion-overwrite-define-key
     '("j" . next-line)
     '("k" . previous-line)
     '("h" . backward-char)
     '("l" . forward-char)
     '("<escape>" . ignore))

    ;; Normal state
    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("1" . meow-expand-1)
     '("2" . meow-expand-2)
     '("3" . meow-expand-3)
     '("4" . meow-expand-4)
     '("5" . meow-expand-5)
     '("6" . meow-expand-6)
     '("7" . meow-expand-7)
     '("8" . meow-expand-8)
     '("9" . meow-expand-9)

     '("h" . meow-left)
     '("j" . meow-next)
     '("k" . meow-prev)
     '("l" . meow-right)

     '("w" . meow-next-word)
     '("b" . meow-back-word)

     '("v" . meow-visit)
     '("V" . meow-grab)
     '("s" . meow-kill)
     '("y" . meow-yank)
     '("p" . meow-yank)
     '("u" . meow-undo)
     '("U" . meow-undo-in-selection)

     '("i" . meow-insert)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("I" . meow-open-above)

     '("x" . meow-line)
     '("/" . meow-search)
     '("<escape>" . meow-cancel-selection))

    ;; Leader(Keypad)
    (meow-leader-define-key
     ;; File/Buffer
     '("f" . find-file)
     '("s" . save-buffer)
     '("b" . consult-buffer)
     '("k" . kill-buffer)
     '("/" . consult-ripgrep)
     '("l" . consult-line)

     ;; Popup/Tree
     '("p" . popper-toggle)
     '("P" . popper-cycle)
     '("t" . treemacs)

     ;; Git/Terminal
     '("g" . magit-status)
     '("v" . vterm)

     ;; Help/Docs
     '("h f" . helpful-callable)
     '("h v" . helpful-variable)
     '("h k" . helpful-key)
     '("h D" . devdocs-lookup)

     ;; Edit helpers
     '("e w" . define-word)
     '("e s" . string-edit-at-point)

     ;; LSP/Diagnostics
     '("c a" . lsp-execute-code-action)
     '("c r" . lsp-rename)
     '("c d" . lsp-find-definition)
     '("c i" . lsp-find-implementation)

     ;; consult-* extra
     '("x e" . consult-flycheck)
     '("x t" . consult-todo)
     '("x y" . consult-yasnippet)

     ;; Org-roam
     '("n f" . org-roam-node-find)
     '("n i" . org-roam-node-insert)
     '("n s" . consult-org-roam-search)))

  (meow-setup)
  (meow-global-mode 1))
