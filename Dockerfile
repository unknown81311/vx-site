FROM ubuntu:22.04

WORKDIR /app/

RUN apt update
RUN apt install curl -y -qq
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install nginx nodejs -y -qq
RUN useradd nginx

COPY . .

RUN npm i

EXPOSE 80

CMD ["/bin/bash", "-c", "service nginx start; node index.js"]
