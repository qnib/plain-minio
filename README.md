# plain-minio
S3 compatible service Minio in a plain container.

```
$ mkdir -p ${HOME}/data/minio
$ docker-app deploy -s minio.server.data=${HOME}/data/minio \
                    -s minio.server.access=AKIAIOSFODNN7EXAMPLE \
                    -s minio.server.secret=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$
```
