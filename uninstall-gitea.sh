#!/bin/sh
systemctl stop gitea
systemctl disable gitea
rm /etc/systemd/system/gitea.service
#rm -R /opt/vdoxx/RFIDListener
systemctl daemon-reload
systemctl reset-failed
