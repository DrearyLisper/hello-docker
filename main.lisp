(defpackage :hello-docker
  (:use :cl :trivia)
  (:export #:main))

(in-package :hello-docker)

(defun main ()
  (format t "Hello, world! ~%"))
