FROM fukamachi/sbcl

WORKDIR /app
COPY . /app

RUN sbcl \
         --load hello-docker.asd \
         --eval "(ql:quickload :hello-docker)" \
         --eval "(sb-ext:exit)"

ENTRYPOINT sbcl \
         --load hello-docker.asd \
         --eval "(ql:quickload :hello-docker)" \
         --eval "(hello-docker:main)" \
         --eval "(sb-ext:exit)"
