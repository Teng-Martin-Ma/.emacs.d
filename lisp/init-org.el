; set org agenda files
(use-package org
    :ensure t
    :init
    (setq org-agenda-files '("~/Documents/Onedrive/agenda.org")
          org-src-fontify-natively t
          org-log-done 'time)
  :config
  (add-to-list 'org-structure-template-alist
               '("p" "#+BEGIN_SRC python  :results output\n?\n#+END_SRC"))
  (add-to-list 'org-structure-template-alist
               '("ep" "#+BEGIN_SRC ein-python :session localhost :results raw drawer\n
                       \\?\n
                       \\#+END_SRC"))
  (add-to-list 'org-structure-template-alist
               (list "t" (concat 
                    "#+BEGIN_EXPORT latex\n"
                    "\\begin{table}[!htb]\n"
                    "\\centering\n"
                    "\\caption{} \\label{tab:}\n"
                    "\\begin{tabular}{ccc}\n"
                    "\\toprule[1pt]\n"
                    "\\head{} & \\head{} & \\head{}\\\\\n"
                    "\\midrule[0.75pt]\n"
                    "?\n"
                    "\\bottomrule[1pt]\n"
                    "\\end{tabular}\n"
                    "\\end{table}\n"
                    "#+END_EXPORT")))
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
      '(("t" "New TODO" entry (file+headline "~/Documents/Onedrive/agenda.org" "New entries")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\")) DEADLINE: %(org-insert-time-stamp (org-read-date  nil t \"+0d\"))\n  *ADDRESS*: %i\n")))


;; agenda settings
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-deadlines t)
(setq org-agenda-todo-ignore-timestamp t)
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-start-on-weekday nil)

;; always agenda window
(setq org-agenda-window-setup (quote current-window))

;--------------------------------------------------------------------------------------

;; enable python in src block
(org-babel-do-load-languages
  'org-babel-load-languages
  '((python . t)
    (latex . t)))

;; don't ask when evaluate
(setq org-confirm-babel-evaluate nil)


;; org-ref
(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))



(use-package org-ref
  :ensure t
  :init
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  (setq reftex-default-bibliography '("~/Documents/Onedrive/references.bib"))
  (setq org-ref-bibliography-notes "~/Documents/Onedrive/notes.org"
        org-ref-default-bibliography '("~/Documents/Onedrive/references.bib")
        org-ref-pdf-directory "~/Documents/Articles/")
  (setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f")))

;; org-bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))


(provide 'init-org)
