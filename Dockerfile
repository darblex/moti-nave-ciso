FROM nginx:alpine
RUN apk add --no-cache gettext bash
COPY index.html /usr/share/nginx/html/index.html
RUN echo 'server { listen $PORT default_server; root /usr/share/nginx/html; index index.html; location / { try_files $uri /index.html; } }' > /etc/nginx/templates/default.conf.template
ENV PORT=8080
EXPOSE 8080
CMD ["/bin/sh", "-c", "envsubst '$PORT' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && rm /etc/nginx/conf.d/default.conf.bak 2>/dev/null; nginx -g 'daemon off;'"]
