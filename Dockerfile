FROM ubuntu:16.04

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

RUN apt update && apt upgrade -y
RUN apt install -y build-essential gcc wget git libvips curl ca-certificates gnupg
RUN curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh
RUN chmod 500 nsolid_setup_deb.sh
RUN ./nsolid_setup_deb.sh 18
RUN apt-get install nodejs npm -y
RUN npm install --force

EXPOSE 4888

CMD ["npm", "start"]