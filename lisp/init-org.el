(use-package org
  :init
  (setq org-src-fontify-natively t
	org-log-done 'time))

(setq org-todo-keywords
      '((sequence "TODO" "Delay" "|" "Done" "Canceled")))


;;  TODO entry to automatically change to DONE when all children are done
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(provide 'init-org)
