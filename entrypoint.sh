#!/bin/bash

crontab -l > /tmp/mycron
echo "${FREQUENCY}" domain-connect-dyndns update --all --config /config/config >> /tmp/mycron
crontab /tmp/mycron
rm /tmp/mycron

exec /usr/sbin/crond -f -l 0
