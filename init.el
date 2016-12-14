;;Initializing package manager
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;;Loading Sensible Defaults
(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/delete-trailing-whitespace)
(sensible-defaults/increase-gc-threshold)
(sensible-defaults/show-matching-parens)
(sensible-defaults/bind-home-and-end-keys)
(sensible-defaults/automatically-follow-symlinks)
(sensible-defaults/offer-to-create-parent-directories-on-save)
(sensible-defaults/single-space-after-periods)
(sensible-defaults/make-dired-file-sizes-human-readable)
(sensible-defaults/refresh-buffers-when-files-change)
(sensible-defaults/bind-keys-to-change-text-size)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil flycheck magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
