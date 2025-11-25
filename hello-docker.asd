(asdf:defsystem "hello-docker"
  :build-operation program-op
  :build-pathname "hello-docker"
  :entry-point "hello-docker::main"
  :depends-on (:trivia :woo)
  :components ((:file "main")))
