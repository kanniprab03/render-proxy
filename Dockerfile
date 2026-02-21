FROM alpine:latest

RUN apk add --no-cache tinyproxy

RUN sed -i 's/^Port .*/Port 10000/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^#Allow 127.0.0.1/Allow 0.0.0.0/' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/^Allow 127.0.0.1/Allow 0.0.0.0/' /etc/tinyproxy/tinyproxy.conf && \
    echo "ConnectPort 443" >> /etc/tinyproxy/tinyproxy.conf && \
    echo "ConnectPort 80" >> /etc/tinyproxy/tinyproxy.conf && \
    echo "ConnectPort 8080" >> /etc/tinyproxy/tinyproxy.conf

CMD tinyproxy -d
