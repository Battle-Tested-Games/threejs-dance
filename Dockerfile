# Game Hub prototype image (Battle-Tested-Games fork): build, then serve the static files with nginx.
FROM alpine:3.20 AS build
WORKDIR /app
# The upstream gulp build is committed in dist/; serve it as-is.
COPY dist ./dist

FROM nginx:1.29-alpine AS runtime
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
