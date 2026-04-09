;;; completion.el -*- lexical-binding: t; -*-
(provide 'completion)

;; Minibuffer completion stack
(use-package vertico :init (vertico-mode 1))
(use-package savehist :init (savehist-mode 1))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil))

(use-package marginalia :init (marginalia-mode 1))

(use-package consult
  :bind (("C-s" . consult-line)
         ("C-c b" . consult-buffer)
         ("C-c k" . consult-ripgrep)
         ("C-c m" . consult-imenu)))

;; embark + embark-consult
(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)))
(use-package embark-consult :after (embark consult))

;; Corfu + Cape
(use-package corfu
  :init (global-corfu-mode 1)
  :custom
  (corfu-auto t)
  (corfu-cycle t))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

;; Snippets
(use-package yasnippet :init (yas-global-mode 1))
(use-package yasnippet-snippets :after yasnippet)

;; consult-yasnippet
(use-package consult-yasnippet
  :after (consult yasnippet)
  :commands (consult-yasnippet))

;; all-the-icons-completion
(use-package all-the-icons-completion
  :after marginalia
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup))
