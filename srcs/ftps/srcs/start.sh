#!/bin/sh

#start telegraf and vsftpd
telegraf & vsftpd /etc/vsftpd/vsftpd.conf
