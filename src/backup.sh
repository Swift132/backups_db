#!/bin/bash
#Backup Script
mysqldump -u root -p$MYSQL_ROOT_PASSWORD mysql > /dados/teste.sql 2>/etc/null

