;; install MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; load init files
(add-to-list 'load-path
	     "~/.emacs.d/lisp/")

(package-refresh-contents)
;; install use-package
(unless (package-installed-p 'use-package)
    (package-install 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(require 'init-frame)
(require 'init-global)
(require 'init-ivy)
(require 'init-emacs-lisp)
(require 'init-python)
(require 'init-dired)
(require 'init-org)
(require 'custom)

;; bind keystroke to init file
(defun open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; wirte custom settings into custom.el
(setq custom-file (expand-file-name
		   "lisp/custom.el" user-emacs-directory))
