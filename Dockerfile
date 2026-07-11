FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html

COPY index.html.gz.b64 /tmp/index.html.gz.b64

RUN base64 -d /tmp/index.html.gz.b64 | gzip -d > /usr/share/nginx/html/index.html \
 && rm /tmp/index.html.gz.b64 \
 && echo "80dba7f5c515c6b00729b536207c9398dd86862001f3c3d77c5288f67de636d8  /usr/share/nginx/html/index.html" | sha256sum -c

EXPOSE 80
