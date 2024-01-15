(defsystem "xv-env"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "xv-env/tests"))))

(defsystem "xv-env/tests"
  :author ""
  :license ""
  :depends-on ("xv-env"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for xv-env"
  :perform (test-op (op c) (symbol-call :rove :run c)))
