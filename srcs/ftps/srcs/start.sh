#!/bin/sh

# Start Telegraf and vsFTPd.
telegraf & vsftpd /etc/vsftpd/vsftpd.conf
