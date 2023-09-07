FROM ubuntu:22.04

WORKDIR /app/

RUN apt update
RUN apt install curl -y -qq
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install nginx nodejs -y -qq

COPY . .

RUN npm i

EXPOSE 3000

CMD ["/bin/bash", "-c", "service nginx start; node index.js"]
