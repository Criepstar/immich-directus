FROM directus/directus:latest

USER root
RUN pnpm install directus-extension-immich
