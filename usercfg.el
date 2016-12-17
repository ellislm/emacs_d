(setq inhibit-splash-screen t)
(setq initial-scratch-message
   "
;                           _____    ______________
;                          |     |  /              \\
;                          | | | | <  hello world!  |
;                          |_____|  \\______________/
;                    ____ ___|_|___ ____
;                   ()___)         ()___)
;                   // /|           |\\ \\\\
;                  // / |           | \\ \\\\
;                 (___) |___________| (___)
;                 (___)   (_______)   (___)
;                 (___)     (___)     (___)
;                 (___)      |_|      (___)
;                 (___)  ___/___\\___   | |
;                  | |  |           |  | |
;                  | |  |___________| /___\\
;                 /___\\  |||     ||| //  \\\\
;                //   \\\\ |||     ||| \\\\   //
;                \\\\   // |||     |||  \\\\ //
;                 \\\\ // ()__)   (__()
;                       ///       \\\\\\
;                      ///         \\\\\\
;                    _///___     ___\\\\\\_
;                   |_______|   |_______|
")
(setq backup-directory-list `(("." . "~/.emacs.d/saves")))

;; Indents, tab as spaces
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)

;; evil-mode
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(evilnc-default-hotkeys)
(require 'nyan-mode)
(nyan-mode 1)
(global-set-key (kbd "C-'") 'helm-M-x)
(global-set-key (kbd "C-;") 'switch-to-buffer)
(global-set-key (kbd "C-x t") 'eshell)

;;Origami
(define-key evil-normal-state-map (kbd "SPC") 'origami-toggle-node)
(define-key evil-normal-state-map "zo" 'origami-toggle-all-nodes)
(define-key evil-normal-state-map  "zi" 'origami-show-only-node)
(require 'origami)
(setq global-origami-mode 1)
(global-origami-mode)
;;Nerd Commenter
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)


;;MatlabMode
(defun matlab-mode-hook-config ()
(local-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines))
(add-hook 'matlab-mode-hook 'matlab-mode-hook-config)
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

(add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode)
(exec-path-from-shell-initialize)


;;line Numbers
(eval-after-load 'linium
  '(progn
     (defface linum-leading-zero
       `((t :inherit 'linum
            :foreground ,(face-attribute 'linum :background nil t)))
       "Face for displaying leading zeroes for line numbers in display margin."
       :group 'linum)

     (defun linum-format-func (line)
       (let ((w (length
                 (number-to-string (count-lines (point-min) (point-max))))))
         (concat
          (propertize (make-string (- w (length (number-to-string line))) ?0)
                      'face 'linum-leading-zero)
          (propertize (number-to-string line) 'face 'linum))))

     (setq linum-format 'linum-format-func)))
(global-linum-mode 1)

(require 'evil-magit)
(require 'sr-speedbar)
;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))
