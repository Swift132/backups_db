#!/bin/bash
#Backup Script

set -e 
base_name=backup.sql
current_time=$(date +"%Y-%m-%d_%H:%M:%S")
file_name=$curr_time_$base_name

mysqldump -u root -p$MYSQL_ROOT_PASSWORD mysql > $file_name 2>/dev/null