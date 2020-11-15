#!/bin/sh

# Start Telegraf, sshd, and Nginx.
# sshd (OpennSSH Daemon) is the daemon program for ssh. Together these programs replace rlogin and rsh,
# and provide secure encrypted communications between two untrusted hosts over an insecure network.
# For normal production on a server, use the default daemon on. In this case for Docker containers, set the daemon off.
telegraf & /usr/sbin/sshd && nginx -g 'daemon off;'
