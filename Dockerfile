FROM fukamachi/sbcl

RUN apt update
RUN apt install -y libev-dev gcc

RUN sbcl \
         --eval "(ql:quickload :trivia)" \
         --eval "(ql:quickload :woo)" \
         --eval "(sb-ext:exit)"

EXPOSE 5000

WORKDIR /app
COPY . /app

RUN sbcl \
         --load hello-docker.asd \
         --eval "(asdf:make :hello-docker)"

ENTRYPOINT /app/hello-docker
