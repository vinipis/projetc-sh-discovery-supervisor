#!/bin/bash
#===============================================================================
# IDENTIFICATION DIVISION
#        ID SVN:   $Id$
#          FILE:  /opt/zabbix/supervisor_discovery.shh
#         USAGE:  ./supervisor_discovery.sh
#   DESCRIPTION:  ---
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#          TODO:  ---
#        AUTHOR:  Carlos Vinicius (cvf.999@gmail.com)
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  20/05/2019 08:00:00 AM BRT
#      REVISION:  20/05/2019 09:00:00 AM BRT
#===============================================================================

echo -n '{"data":['

for SUPERVISOR in $(supervisorctl status all | awk -F' ' '{print $1, "\t\t"}'); do
    echo -n "{\"{#SUPERVISOR}\": \"${SUPERVISOR}\"},"
done | sed -e 's:\},$:\}:'

echo -n ']}'
