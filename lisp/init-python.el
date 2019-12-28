;; set anaconda env in emacs
(use-package pyvenv
  :init
  (if (eq window-system 'darwin)
    (setenv "WORKON_HOME" "/Users/martin/miniconda3")
    (if (eq window-system 'windows-nt)
      (setenv "WORKON_HOME" "/d/miniconda3")))
  :config
  (pyvenv-mode 1)
  (if (eq window-system 'darwin)
    (pyvenv-activate "/Users/martin/miniconda3")
    (if (eq window-system 'windows-nt)
      (pyvenv-activate "/d/miniconda3"))))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PYTHONPATH"))

(use-package anaconda-mode
  :commands
  anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;; anaconda-mode eval-after
(use-package company
  :no-require t
  :config
  (use-package company-anaconda
    :init
    (add-to-list 'company-backends 'company-anaconda)))

;; ein
(use-package ein
  :ensure t)

(provide 'init-python)
