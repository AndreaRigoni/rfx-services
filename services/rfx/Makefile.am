include $(top_srcdir)/Common.mk
include $(top_srcdir)/services/docker_services.mk
include $(top_srcdir)/services/docker_machine.mk



COMPOSER_FILE = docker-compose.yml
SERVICE       = registry
SWARM_NAME    = rfx

start-local: 
stop-local:


# networks.yml: networks.yml.in
# 	@ $(call __ax_pl_envsubst2,$<,$@);



##     .##.....##....###.....######..##.....##.####.##....##.########
##     .###...###...##.##...##....##.##.....##..##..###...##.##......
##     .####.####..##...##..##.......##.....##..##..####..##.##......
##     .##.###.##.##.....##.##.......#########..##..##.##.##.######..
##     .##.....##.#########.##.......##.....##..##..##..####.##......
##     .##.....##.##.....##.##....##.##.....##..##..##...###.##......
##     .##.....##.##.....##..######..##.....##.####.##....##.########

# this is a simple test of the docker machine integration foreseen for 
# autoconf-bootstrap project. Further development will be done in the 
# dk.sh script file.

DOCKER_MACHINES = b2d1 ros1


ros1_ISO = https://releases.rancher.com/os/latest/rancheros.iso

# not working
# cos1_ISO = http://centos.mirror.garr.it/centos/7.6.1810/isos/x86_64/CentOS-7-x86_64-Minimal-1810.iso

# DSHELL_ARGS = -v # DEBUG #

etargets = ls bash
DOCKER_TARGETS = $(etargets)
$(etargets): DOCKER_CONTAINER = etargets
$(etargets): DOCKER_IMAGE   = alpine #rigoni/linux-socdev:latest
$(etargets): DOCKER_MACHINE = b2d1
$(etargets): 
	@$@





