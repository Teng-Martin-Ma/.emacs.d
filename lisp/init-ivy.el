(use-package counsel
  :init
  (setq ivy-use-virutal-buffers t
        enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(provide 'init-ivy)
