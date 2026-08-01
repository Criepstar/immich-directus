FROM directus/directus:latest

USER root
RUN npm install --global corepack@latest
RUN corepack enable

USER node
RUN pnpm install directus-extension-immich
