;; auto give another part of parens
(use-package smartparens
  :ensure t
  :config
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil))

(provide 'init-emacs-lisp)
