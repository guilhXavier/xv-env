(defpackage xv-env
  (:use :cl))
(in-package :xv-env)

(defun xv-env/read-lines (&key (path-to-file "./.env"))
  "This function reads the lines of a enviroment variable file"
  (let ((true-name (probe-file path-to-file)))
    (if true-name
        (uiop:read-file-lines true-name)
        "File not found.")))

(defun xv-env/split-lines (lines)
  "This function turns a list of lines into a list of key-value pairs"
  (mapcar (lambda (line)
            (uiop:split-string line :separator "=")) lines))

