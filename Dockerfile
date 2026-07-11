FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html

COPY parts/index.part1 /tmp/index.part1
COPY parts/index.part2 /tmp/index.part2
COPY parts/index.part3 /tmp/index.part3
COPY openapi.yaml /usr/share/nginx/html/openapi.yaml
COPY developers.html /usr/share/nginx/html/developers.html
COPY pilot.html /usr/share/nginx/html/pilot.html
COPY proof.json /usr/share/nginx/html/proof.json
COPY tjs.json /usr/share/nginx/html/tjs.json

RUN cat /tmp/index.part1 /tmp/index.part2 /tmp/index.part3 > /usr/share/nginx/html/index.html  && rm /tmp/index.part1 /tmp/index.part2 /tmp/index.part3  && echo "80dba7f5c515c6b00729b536207c9398dd86862001f3c3d77c5288f67de636d8  /usr/share/nginx/html/index.html" | sha256sum -c

EXPOSE 80
