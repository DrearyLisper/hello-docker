(defpackage :hello-docker
  (:use :cl :trivia)
  (:export #:main))

(in-package :hello-docker)

(defun main ()
  (woo:run
   (lambda (env)
     (declare (ignore env))
     (list 200 '(:content-type "text/plain")
           (list (format nil "(compiled) Hello, from ~A" (machine-instance)))))
  :port 5000
  :address "0.0.0.0"))
