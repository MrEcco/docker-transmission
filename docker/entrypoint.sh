#!/bin/sh

CONFIG_DIR=${CONFIG_DIR:-/config}
DATA_DIR=${CONFIG_DIR:-/data}
LOG_LEVEL=${LOG_LEVEL:-info}
PEER_PORT=${PEER_PORT:-51000}

if ! test -f ${CONFIG_DIR}/settings.json; then
    mkdir -p ${CONFIG_DIR}
    cp /opt/tmpl/settings.json ${CONFIG_DIR}/settings.json
fi

exec /usr/bin/transmission-daemon \
    --foreground \
    --config-dir ${CONFIG_DIR} \
    --download-dir ${DATA_DIR} \
    --log-level ${LOG_LEVEL} \
    --peerport ${PEER_PORT} \
    "$@"
