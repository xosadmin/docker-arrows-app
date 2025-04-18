FROM node:lts

RUN apt update -y --fix-missing && \
  apt install git -y

RUN apt clean all && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/neo4j-labs/arrows.app.git . 

RUN npm install

RUN npm run build

RUN npm install -g serve

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]
