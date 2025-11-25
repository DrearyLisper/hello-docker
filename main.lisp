(defpackage :hello-docker
  (:use :cl :trivia :woo)
  (:export #:main))

(in-package :hello-docker)

(defun read-template (path)
  "Read and return the contents of a template file"
  (with-open-file (stream path :direction :input :if-does-not-exist :error)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents)))

(defun main ()
  (woo:run
   (lambda (env)
     (let ((path (getf env :request-uri)))
       (cond
         ((string= path "/style.css")
          (list 200 '(:content-type "text/css")
                (list (read-template "templates/style.css"))))
         (t
          (let ((machine (machine-instance)))
            (multiple-value-bind (sec min hour date month year)
                (get-decoded-time)
              (list 200 '(:content-type "text/html")
                    (list (format nil (read-template "templates/index.html") machine year month date hour min sec))) ))) )))
   :port 5000
   :address "0.0.0.0"))
