;; set python path
(setq python-shell-interpreter "/Users/martin/Software/miniconda3/bin/python")


;; anaconda-mode
(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))


;; company-anaconda
(use-package company-anaconda
  :ensure t
  :config
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda)))


(provide 'init-python)
