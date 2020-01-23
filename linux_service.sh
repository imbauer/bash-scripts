#!/usr/bin/env bash

echo "Check open ports"
netstat -tulpn
printf "\n"
printf "\n"

echo "Display all running services"
systemctl list-unit-files --no-page | grep enabled
printf "\n"
printf "\n"

echo "Enter the service that you want to check on: "
read SERVICE

systemctl status ${SERVICE} --no-page

printf "\n"
printf "\n"

echo "Enter the absolute path to check the size of a directory's contents:"
read ABS_PATH
du -sh ${ABS_PATH}

printf "\n"
printf "\n"


