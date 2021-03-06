;; Set the fonts
(setq default-frame-alist
  '((height . 30)
  	(width . 80)))

(cond 
  ((string-equal system-type "windows-nt")
   (add-to-list 'default-frame-alist
     '(font . "Consolas-14")))
  ((string-equal system-type "darwin")
   (add-to-list 'default-frame-alist
     '(font . "Fira Code-16"))))


;; close the startup frame
(setq inhibit-startup-screen t)


;; close the tool-bar menu-bar scroll-bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)


;; solarize theme
(use-package solarized-theme
	:ensure t
	:config
	(load-theme 'solarized-dark t))


(provide 'init-frame)
