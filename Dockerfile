FROM nginx:alpine

# Silence the /docker-entrypoint.sh chatter
ENV NGINX_ENTRYPOINT_QUIET_LOGS=1

# Fixed worker count and warn-level error log instead of one worker per CPU at notice level
RUN sed -i -e 's/^worker_processes.*/worker_processes 2;/' \
           -e 's/^\(error_log .*\) notice;/\1 warn;/' /etc/nginx/nginx.conf

# Remove default nginx config and site
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/app.conf
COPY public/ /usr/share/nginx/html/

EXPOSE 3000