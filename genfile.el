(setq make-backup-files nil)
(require 'org)

(find-file "tutorial.org")
(setq org-latex-log-level 3)
(org-latex-export-to-pdf)

(when (file-exists-p "./tutorial.tex")
  (rename-file "./tutorial.tex" "./tmp/tutorial.tex" t))

(when (file-exists-p "./tutorial.pdf")
(rename-file "./tutorial.pdf" "./tmp/tutorial.pdf" t))
