(defpackage :hello-docker
  (:use :cl :trivia)
  (:export #:main))

(in-package :hello-docker)

(defun main ()
  (woo:run
   (lambda (env)
     (declare (ignore env))
     '(200 (:content-type "text/plain") ("Hello, World")))
  :address "0.0.0.0"))
