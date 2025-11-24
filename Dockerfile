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

ENTRYPOINT sbcl \
         --load hello-docker.asd \
         --eval "(ql:quickload :hello-docker)" \
         --eval "(hello-docker:main)" \
         --eval "(sb-ext:exit)"
