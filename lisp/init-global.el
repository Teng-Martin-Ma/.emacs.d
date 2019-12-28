;; open recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; turn on global visual line mode
(global-visual-line-mode 1)

;; auto show parenthese
(show-paren-mode 1)

;; turn on global company mode
(use-package company
  :config
  (global-company-mode t))

;; change cursor to bar
(setq-default cursor-type 'bar)

;; don't make backup files
(setq make-backup-files nil)

;; delete selection mode
(delete-selection-mode t)

;; highlight current line
(global-hl-line-mode t)

;; smart parens
(use-package smartparens
  :config
  (smartparens-global-mode t))

;; change file outside but show in emacs
(global-auto-revert-mode t)

;; no bells
(setq ring-bell-function 'ignore)

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; expand region
(use-package expand-region
  :bind
  ("C-=" . 'er/expand-region))


(provide 'init-global)
