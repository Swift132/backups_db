FROM mysql:5.7

COPY ./scr /source

RUN chmod +x /source/script.sh

RUN echo "* * * * root /source/script.sh" >> /etc/crontab