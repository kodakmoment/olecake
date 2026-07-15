FROM nginx:alpine

# Remove default nginx config and site
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/app.conf
COPY public/ /usr/share/nginx/html/

EXPOSE 3000