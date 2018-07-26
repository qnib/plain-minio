#!/bin/bash
if [[ "X${MINIO_HTTP_SERVERS}" != "X" ]];then
    MINIO_OPTS="$(echo ${MINIO_HTTP_SERVERS} |sed -e 's/,/ /g')"
elif [[ ${MINIO_TASK_COUNT:-1} > 1 ]];then
    echo "MINIO_TASK_COUNT: ${MINIO_TASK_COUNT}"
    mkdir -p /opt/healthcheck/
    mkdir -p "${MINIO_DATA}/t${SWARM_TASK_SLOT}"
    MINIO_OPTS="""$(go-fisherman --mintasks ${MINIO_TASK_COUNT} --template "http://{{.IP}}/data/t{{.TaskSlot}}" server)"""
else
    mkdir -p "${MINIO_DATA}/t${SWARM_TASK_SLOT}"
    MINIO_OPTS="${MINIO_DATA}/t${SWARM_TASK_SLOT}"
fi
echo ">> minio server ${MINIO_OPTS}"
minio server ${MINIO_OPTS}
