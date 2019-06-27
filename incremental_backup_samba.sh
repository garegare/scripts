#!/bin/bash

rsync -a --delete --link-dest=/mnt/backuphdd1/bk/`ls /mnt/backuphdd1/bk/ | tail -n 1` /opt/samba/photo/2* /mnt/backuphdd1/bk/$(date "+%Y%m%d-%H%M%S")
