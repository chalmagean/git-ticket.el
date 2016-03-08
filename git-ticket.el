;;; git-ticket.el --- Extract the ticket number from the git branch

;; Copyright (C) 2016 Cezar Halmagean

;; Author: Cezar Halmagean <cezar@halmagean.ro>
;; Version: 1.0
;; Keywords: git, magit
;; URL: https://github.com/chalmagean/git-ticket.el

;;; Commentary:

;; git-ticket.el is a lightweight function that extracts the ticket identifier
;; from your current git branch and inserts it at the current cursor position.

;;; Code:
(require 'magit)

(defun git-ticket ()
  (interactive)
  (let* ((current-branch-name (magit-get-current-branch))
        (git-ticket (git-ticket-number-in-current-branch current-branch-name)))
    (if git-ticket
        (insert git-ticket))))

(defun git-ticket-number-in-current-branch (current-branch-name)
  (if (string-match "[a-z]+/\\([0-9a-zA-Z]+\\)_" current-branch-name)
      (concat "[#" (match-string 1 current-branch-name) "] ")
    nil))

(provide 'git-ticket)
;;; git-ticket.el ends here
