FROM node:18

# Instalar dependencias del servidor
RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/vrtmrz/obsidian-livesync.git /app

WORKDIR /app

RUN npm install

# Variables de entorno básicas
ENV COUCHDB_USER=admin
ENV COUCHDB_PASSWORD=12345678909*
ENV COUCHDB_SECRET=$(openssl rand -hex 16)
ENV PORT=5984

EXPOSE 5984

CMD ["npm", "start"]
