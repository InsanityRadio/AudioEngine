FROM openresty/openresty:alpine

COPY ./nginx.conf /etc/nginx/conf.d/run.conf

RUN rm /etc/nginx/conf.d/default.conf

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
