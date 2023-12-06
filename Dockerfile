FROM alpine:3.18

ARG THEME=dark # or light

COPY docker/settings.json /opt/tmpl/settings.json
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh && \
    apk add --no-cache             \
        transmission-daemon     && \
    apk add --no-cache             \
        --virtual temporary        \
        git                     && \
    git clone https://git.eigenlab.org/sbiego/transmission-web-soft-theme && \
    cp -r transmission-web-soft-theme/web/* /usr/share/transmission/public_html/ && \
    rm -rf transmission-web-soft-theme && \
    apk del temporary           && \
    sed -i '21i\\t\t<link href="./style/transmission/soft-theme.min.css" type="text/css" rel="stylesheet" />\n\t\t<link href="style/transmission/soft-'${THEME}'-theme.min.css" type="text/css" rel="stylesheet" />\n' /usr/share/transmission/public_html/index.html

ENV CONFIG_DIR=/config
ENV DATA_DIR=/data
ENV LOG_LEVEL=info
ENV PEER_PORT=51000

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD []
