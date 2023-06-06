FROM mysql:5.7

COPY ./src /source

RUN yum update -y && yum install -y cronie

RUN chmod +x /source/backup.sh

# Adding crontab information to the appropriate location
RUN echo "* * * * * root /source/backup.sh" > /etc/cron.d/my-cron-file

# Giving permission to crontab file
RUN chmod 0644 /etc/cron.d/my-cron-file

# Running crontab
RUN crontab /etc/cron.d/my-cron-file