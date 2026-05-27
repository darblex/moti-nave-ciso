FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY start.sh /start.sh
RUN chmod +x /start.sh && rm -f /etc/nginx/conf.d/default.conf
ENV PORT=8080
EXPOSE 8080
CMD ["/start.sh"]
