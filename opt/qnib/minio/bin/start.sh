#!/bin/bash
if [[ "X${MINIO_HTTP_SERVERS}" != "X" ]];then
    MINIO_OPTS="$(echo ${MINIO_HTTP_SERVERS} |sed -e 's/,/ /g')"
elif [[ ${MINIO_TASK_COUNT:-1} > 1 ]];then
    echo "MINIO_TASK_COUNT: ${MINIO_TASK_COUNT}"
    mkdir -p /opt/healthcheck/
    MINIO_OPTS="$(go-fisherman --mintasks ${MINIO_TASK_COUNT} --template 'http://{{.IP}}/data/' server)"
else
    MINIO_OPTS="${MINIO_DATA}"
fi

echo ">> minio server ${MINIO_OPTS}"
minio server ${MINIO_OPTS}
