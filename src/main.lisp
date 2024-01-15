(defpackage xv-env
  (:use :cl))
(in-package :xv-env)

(defun xv-env/split-lines (lines)
  "This function turns a list of lines into a list of key-value pairs"
  (mapcar (lambda (line)
            (uiop:split-string line :separator "=")) lines))

(defun xv-env/build-dict (list-of-lists)
  "This function builds a dictionary from a list of key-value pairs"
  (mapcar (lambda (sublist)
            (cons (intern (car sublist) "KEYWORD") (cdr sublist))) list-of-lists))

(defun xv-env/read-lines (&key (path-to-file "./.env"))
  "This function reads the lines of a enviroment variable file"
  (let ((true-name (probe-file path-to-file)))
    (if true-name
        (xv-env/build-dict (xv-env/split-lines (uiop:read-file-lines true-name)))
        "File not found.")))

(defun xv-env/build-lists (list-of-lists)
  "This function builds a list containing a list of keys and a list of associated values"
  (cons (mapcar 'car list-of-lists) (mapcar 'cdr list-of-lists)))

(defun get-variables (&optional (path))
  (let ((lines (xv-env/read-lines :path-to-file path)))
    (let ((keys (mapcar 'car lines))
          (values (mapcar 'cdr lines)))
      (pairlis keys values))))

