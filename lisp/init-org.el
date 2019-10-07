;; set org agenda files
(use-package org
  :ensure t
  :init
  (setq org-agenda-files '("~/Onedrive/agenda.org")
        org-src-fontify-natively t
        org-log-done 'time)
  :config
  (add-to-list 'org-structure-template-alist
	       '("sp" "#+BEGIN_SRC python  :results output\n?\n#+END_SRC"))
  :bind
  ("C-c a" . 'org-agenda)
  ("C-c n" . org-capture))


(setq org-todo-keywords
      '((sequence "TODO" "DELAY" "|" "DONE" "CANCELED")))


;;  TODO entry to automatically change to DONE when all children are done
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; capture template
(setq org-capture-templates
      '(("t" "New TODO" entry (file+headline "~/Documents/agenda.org" "New entries")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) DEADLINE: %(org-insert-time-stamp (org-read-date  nil t \"+0d\"))\n  *ADDRESS*: %i\n")))


;; always agenda window
(setq org-agenda-window-setup (quote current-window))


;; enable python in src block
(org-babel-do-load-languages
  'org-babel-load-languages
  '((python . t)))

;; don't ask when evaluate
(setq org-confirm-babel-evaluate nil)

;; org-ref
(use-package htmlize)
(add-to-list 'load-path "~/.emacs.d/elpa/org-ref")
(setq reftex-default-bibliography '("~/Documents/UCL/SAAD/reference.bib"))

(setq org-ref-bibliography-notes "~/Documents/Notes/notes.org"
      org-ref-default-bibliography '("~/Documents/UCL/SAAD/reference.bib")
      org-ref-pdf-directory "~/Documents/Articles/")
(setq bibtex-completion-bibliography "~/Documents/UCL/SAAD/reference.bib"
      bibtex-completion-library-path "~/Documents/Articles/"
      bibtex-completion-notes-path "~/Documents/Notes/")
(setq org-ref-completion-library 'org-ref-ivy-cite)
(require 'org-ref)


;; agenda settings
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-deadlines t)
(setq org-agenda-todo-ignore-timestamp t)
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-start-on-weekday nil)

;; set pdflatex path
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))


(provide 'init-org)
