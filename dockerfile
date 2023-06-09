FROM mysql:5.7

COPY ./src /source

RUN yum update -y && yum install -y cronie

#install ssh client
RUN yum install openssh-clients -y

# Install ssh server
RUN yum install -y openssh-server

RUN chmod +x /source/backup.sh

# Adding crontab information to the appropriate location
RUN echo "* * * * * root /source/backup.sh" > /etc/cron.d/my-cron-file

# Giving permission to crontab file
RUN chmod 0644 /etc/cron.d/my-cron-file

# Running crontab
RUN crontab /etc/cron.d/my-cron-file

# Install Ping 
RUN yum install iputils -y

#install sudo
RUN yum install sudo -y

# Install Ufw Firewall
RUN yum install ufw -y

#create a root user with password in OS
RUN useradd -ms /bin/bash xpto

#set password for xpto user
RUN echo 'xpto:xpto' | chpasswd

#add xpto user to sudoers
RUN usermod -aG wheel xpto

