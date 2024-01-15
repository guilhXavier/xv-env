(defpackage xv-env/tests/main
  (:use :cl
        :xv-env
        :rove))
(in-package :xv-env/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :xv-env)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
