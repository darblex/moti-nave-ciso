FROM nginx:alpine
RUN apk add --no-cache gettext
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
