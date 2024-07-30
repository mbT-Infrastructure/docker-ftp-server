#!/usr/bin/env bash
set -e

vsftpd -opasv_min_port="$PASV_MIN_PORT" -opasv_max_port="$PASV_MAX_PORT" /etc/vsftpd.conf
