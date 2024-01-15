(defpackage xv-env
  (:use :cl))
(in-package :xv-env)

(defparameter *environment-variables* '())

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

(defun xv-env/build-dict (list-of-lists)
  "This function builds a dictionary from a list of key-value pairs"
  (mapcar (lambda (sublist)
            (cons (intern (car sublist) "KEYWORD") (cdr sublist))) list-of-lists))

(defun xv-env/get-keywords (list-of-lists)
  "This function returns a list of keywords"
  (mapcar 'car list-of-lists))

(defun xv-env/get-values (list-of-lists)
  "This function returns a list of values"
  (mapcar 'cdr list-of-lists))

(defun xv-env/test ()
  (let ((lines (xv-env/read-lines :path-to-file "./.env")))
    (let ((dict (xv-env/build-dict (xv-env/split-lines lines))))
      (pairlis (xv-env/get-keywords dict) (xv-env/get-values dict)))))
