#!/bin/sh

# Start Telegraf and Influxdb.
/etc/init.d/telegraf start & influxd
