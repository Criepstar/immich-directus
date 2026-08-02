# Stage 1: use a full Node image (guaranteed to have npm) to fetch the extension
FROM node:20 AS ext-builder
WORKDIR /build
RUN npm install directus-extension-immich
RUN npm install directus-slug-generator


# Stage 2: the actual Directus image, just copy the built extension in
FROM directus/directus:latest
COPY --from=ext-builder --chown=node:node /build/node_modules/directus-extension-immich /directus/extensions/directus-extension-immich
COPY --from=ext-builder --chown=node:node /build/node_modules/directus-slug-generator /directus/extensions/directus-slug-generator
