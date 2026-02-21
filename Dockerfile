FROM alpine:latest

RUN apk add --no-cache tinyproxy

RUN sed -i 's/^Port .*/Port 10000/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#Allow 127.0.0.1/Allow 0.0.0.0/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^Allow 127.0.0.1/Allow 0.0.0.0/' /etc/tinyproxy/tinyproxy.conf

EXPOSE 10000

CMD ["tinyproxy", "-d"]
