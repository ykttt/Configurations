;;; early-init.el -*- lexical-binding: t; -*-

;;use packages provided by Nix
(setq package-enable-at-startup nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t
      frame-resize-pixelwise t
      use-dialog-box nil)

(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.6
      read-process-output-max (* 1024 1024)) ; LSP

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 32 1024 1024)
                  gc-cons-percentage 0.2)))

