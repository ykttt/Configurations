;;; org-setup.el -*- lexical-binding: t; -*-
(provide 'org-setup)

(use-package org-modern
  :hook (org-mode . org-modern-mode))


(use-package org-roam
  :init
  (setq org-roam-directory (file-truename (expand-file-name "~/documents/localFiles/org/roam")))
  (unless (file-directory-p org-roam-directory)
    (make-directory org-roam-directory t))
  :config
  (org-roam-db-autosync-mode 1))

(use-package consult-org-roam
  :after (consult org-roam)
  :init
  (consult-org-roam-mode 1)
  :custom
  (consult-org-roam-grep-func #'consult-ripgrep))
