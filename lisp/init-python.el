;; set anaconda env in emacs
(use-package pyvenv
  :init
  (setenv "WORKON_HOME" "/home/martin/Software/miniconda3/envs")
  :config
  (pyvenv-mode 1)
  (pyvenv-activate "/home/martin/Software/miniconda3"))

;; anaconda-mode eval-after
(use-package company
  :no-require t
  :config
  (use-package company-anaconda
    :init
    (add-to-list 'company-backends 'company-anaconda)))

(use-package anaconda-mode
  :commands
  anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(provide 'init-python)
