#!/bin/bash
#Backup Script
#how to generate a diferent backup file name each time
mysqldump -u root -p$MYSQL_ROOT_PASSWORD mysql > /dados/$(date +%Y%m%d%H%M%S).sql 2>/etc/null