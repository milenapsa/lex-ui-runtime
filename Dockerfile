FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html

COPY modules/index.part1 /tmp/index.part1
COPY parts/index.part2 /tmp/index.part2
COPY index.part3 /tmp/index.part3

RUN cat /tmp/index.part1 /tmp/index.part2 /tmp/index.part3 > /usr/share/nginx/html/index.html \
 && rm /tmp/index.part1 /tmp/index.part2 /tmp/index.part3 \
 && echo "80dba7f5c515c6b00729b536207c9398dd86862001f3c3d77c5288f67de636d8  /usr/share/nginx/html/index.html" | sha256sum -c

EXPOSE 80
