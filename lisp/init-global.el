;; open recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; turn on global visual line mode
(global-visual-line-mode 1)

;; auto show parenthese
(show-paren-mode 1)

;; change cursor to bar
(setq-default cursor-type 'bar)

;; don't make backup files
(setq make-backup-files nil)

;; delete selection mode
(delete-selection-mode t)

;; highlight current line
(global-hl-line-mode t)

;; change file outside but show in emacs
(global-auto-revert-mode t)

;; no bells
(setq ring-bell-function 'ignore)

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)



;; expand region
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . 'er/expand-region))


;; install global company mode
(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1))


;; install ace-window to quick choose window
(use-package ace-window
  :ensure t
  :bind
  ("M-o" . 'ace-window))

(provide 'init-global)
