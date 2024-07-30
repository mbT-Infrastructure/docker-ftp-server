#!/usr/bin/env bash
set -e

if [[ -z "$USERNAME" ]]; then
  echo "Please set Environment variable \"USERNAME\"."
  exit 1
fi
if [[ -z "$PASSWORD" ]]; then
  echo "Please set Environment variable \"PASSWORD\"."
  exit 1
fi

mkdir --parents /media/ftp/data /var/run/vsftpd/empty

usermod --login "$USERNAME" "$(getent passwd 1000 | cut --delimiter=: --fields=1)"
yes "$PASSWORD" | passwd "$USERNAME" 2> /dev/null

chown root /media/ftp
chown "$USERNAME" /media/ftp/data

exec "$@"
