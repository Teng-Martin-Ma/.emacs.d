;; Set the fonts
(setq default-frame-alist
      '((font . "Fira Code-14")
	(height . 30)
	(width . 80)))


;; close the startup frame
(setq inhibit-startup-screen t)


;; close the tool-bar menu-bar scroll-bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)


;; open in fullscreen
(setq initial-frame-alist (quote ((fullscreen . maximized))))


(provide 'init-frame)
