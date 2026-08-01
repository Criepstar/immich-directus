FROM directus/directus:latest

USER root
RUN npm install --global pnpm
RUN pnpm install directus-extension-immich
