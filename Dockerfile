FROM madebytimo/base

RUN apt update -qq && apt install -y -qq vsftpd \
    && rm -rf /var/lib/apt/lists/*

COPY files/vsftpd.conf etc/vsftpd.conf
COPY files/run.sh /usr/local/bin/run.sh
RUN mkdir --parents /media/ftp/data \
    && usermod --home /media/ftp user

ENV USERNAME=""
ENV PASSWORD=""
ENV PASV_MIN_PORT="40000"
ENV PASV_MAX_PORT="40099"

COPY files/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "run.sh" ]
# nosemgrep
HEALTHCHECK CMD [ "bash", "-c", "curl --user \"${USERNAME}:${PASSWORD}\" ftp://localhost" ]
