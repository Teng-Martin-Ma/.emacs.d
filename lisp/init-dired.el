(require 'dired-x)


;; no asks
(setq dired-recursive-copies 'always
      dired-recursive-deletes 'always)

;; keep one buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; copy files to different dired buffer quicker
(setq dired-dwim-target t)


(provide 'init-dired)
