include $(top_srcdir)/Common.mk
include $(top_srcdir)/services/docker_services.mk

## ////////////////////////////////////////////////////////////////////////////////
## //  SERVICE  ///////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

COMPOSER_FILE = $(srcdir)/docker-compose.yml

REROUTE_IP     = 
REROUTE_PORTS  = 

export HOSTNAME \
       REROUTE_IP \
       REROUTE_PORTS \
       SSLCERT_FILE_CRT \
       SSLCERT_FILE_KEY 

DIRS = moodle_data \
       moodledata_data \
       mariadb_data
       
DIRECTORIES = $(DIRS)

start-local: ${SSLCERT_FILE} | $(DIRS)
stop-local:

# image:##@service build image
# image:
# 	docker build $(srcdir)/docker/ -t django-ariaform:latest

## ////////////////////////////////////////////////////////////////////////////////
## //  CERT SSL  //////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

ssl_cert: ##@gitlab generate selfsigned certificate for ${HOSTNAME}
ssl_cert: $(SSLCERT_FILES)

# self sign certificates if they don't exist
SSLCERT_FILES    = $(SSLCERT_FILE_CRT) $(SSLCERT_FILE_KEY)
SSLCERT_FILE_CRT = $(abs_builddir)/selfsigned_$(HOSTNAME).crt
SSLCERT_FILE_KEY = $(abs_builddir)/selfsigned_$(HOSTNAME).key

${SSLCERT_FILES}:
	@ $(info generating cert for $@) \
	  . $(srcdir)/gencert.sh $(basename $(notdir $@)) $(dir $@)


## ////////////////////////////////////////////////////////////////////////////////
## //  INSTALL  ///////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

define SERVICE_EXPORTS = 
export SSLCERT_FILE_CRT=$(SSLCERT_FILE_CRT)
export SSLCERT_FILE_KEY=$(SSLCERT_FILE_KEY)
endef

$(INSTALL_TARGETS): SSLCERT_FILE_CRT := $(SERVICE_DIR)/$(notdir $(SSLCERT_FILE_CRT))
$(INSTALL_TARGETS): SSLCERT_FILE_KEY := $(SERVICE_DIR)/$(notdir $(SSLCERT_FILE_KEY))

SERVICE_DATA = $(DIRS) \
               $(SSLCERT_FILES)

## ////////////////////////////////////////////////////////////////////////////////
## //  CLEAN  /////////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

# CLEANFILES = selfsigned_* 



