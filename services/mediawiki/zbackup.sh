#!/bin/bash

cd /root/docker-devel/rfx-services/services
rsync -av --delete mediawiki /mnt/disk1/backup > /dev/null
date > /mnt/disk1/backup/mediawiki.LASTBACKUP
