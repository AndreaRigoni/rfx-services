include $(top_srcdir)/Common.mk
include $(top_srcdir)/services/docker_services.mk

## ////////////////////////////////////////////////////////////////////////////////
## //  SERVICE  ///////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

COMPOSER_FILE = $(srcdir)/docker-compose.yml

DIRS = ${STORE_DIR}/config \
       ${STORE_DIR}/influxdb/data \
       ${STORE_DIR}/grafana/data 

DIRECTORIES = $(DIRS)

start-local: $(DIRS)
stop-local:




# curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE rfx'
