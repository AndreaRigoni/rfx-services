include $(top_srcdir)/Common.mk
include $(top_srcdir)/services/docker_services.mk

## ////////////////////////////////////////////////////////////////////////////////
## //  SERVICE  ///////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

COMPOSER_FILE = $(srcdir)/docker-compose.yml

REROUTE_IP     = $(GITLAB_PUBLIC_IP)
REROUTE_PORTS  = $(GITLAB_PUBLIC_PORTS)
DJANGO_WEB_PORT = 8087

export HOSTNAME \
       REROUTE_IP \
       REROUTE_PORTS \
       SSLCERT_FILE_CRT \
       SSLCERT_FILE_KEY \
       DJANGO_WEB_PORT

export gitlab_email_from = donotreply@igi.cnr.it

DIRS = data/db code

DIRECTORIES = $(DIRS)

start-local: ${SSLCERT_FILE} | $(DIRS)
stop-local:


DJANGO_PROJECT = rfxexample

start-project: ##@django start project in DJANGO_PROJECT
start-project:
	docker-compose run web django-admin startproject $(DJANGO_PROJECT) .

start-app: ##@service start app in django
start-app:
	docker exec $$(docker service ps django-ariaform_web -q)



image:##@service build image
image:
	docker build $(srcdir)/docker/ -t django-ariaform:latest

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
               $(SSLCERT_FILES) \
               RFX_code.png \
               gitlab.rb

## ////////////////////////////////////////////////////////////////////////////////
## //  CLEAN  /////////////////////////////////////////////////////////////////////
## ////////////////////////////////////////////////////////////////////////////////

CLEANFILES = selfsigned_* 



