#!/bin/bash

cp /var/www/data/rfxwiki.sqlite . ; rsync -av /var/www/html/wiki/images/ images/ ;  make stop ; sleep 10 ; make start
echo wgUpgradeKey: 34ea931c7051976a
echo http://wiki.igi.cnr.it/mw-config
