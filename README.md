# plain-minio
S3 compatible service Minio in a plain container.

```
$ mkdir -p ${HOME}/data/minio
$ docker-app deploy -s minio.server.data=${HOME}/data/minio \
                    -s minio.server.access=AKIAIOSFODNN7EXAMPLE \
                    -s minio.server.secret=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$
```

## Use settings file

In order to make it reproducible create a settings file and overwrite the default settings.

```
$ cat myconfig
---
minio:
  server:
    data: /home/user/data/minio
    access: AKIAIOSFODNN7EXAMPLE
    secret: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ docker-app deploy -f myconfig
```
