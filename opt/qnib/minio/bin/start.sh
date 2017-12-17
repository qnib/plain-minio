#!/bin/bash

if [[ "X${MINIO_HTTP_SERVERS}" != "X" ]];then
    MINIO_OPTS="$(echo ${MINIO_HTTP_SERVERS} |sed -e 's/,/ /g')"
else
    MINIO_OPTS="${MINIO_DATA}"
fi

minio server ${MINIO_OPTS}
