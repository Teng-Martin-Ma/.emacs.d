;; simply install counsel which will bring in ivy swiper as dependencies.
(use-package counsel
  :ensure t
  :init
  (setq ivy-use-virutal-buffers t
        enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  :config
  (ivy-mode 1)
  :bind
  ("\C-s" . 'swiper)
  ("C-c C-r" . 'ivy-resume)
  ("<f6>" . 'ivy-resume)
  ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  ("<f1> f" . 'counsel-describe-function)
  ("<f1> v" . 'counsel-describe-variable)
  ("<f1> l" . 'counsel-find-library)
  ("<f2> i" . 'counsel-info-lookup-symbol)
  ("<f2> u" . 'counsel-unicode-char)
  ("C-c g" . 'counsel-git)
  ("C-c j" . 'counsel-git-grep)
  ("C-c k" . 'counsel-ag)
  ("C-x l" . 'counsel-locate)
  ("C-S-o" . 'counsel-rhythmbox))

(provide 'init-ivy)
