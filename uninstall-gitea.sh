#!/bin/sh

systemctl stop gitea
systemctl disable gitea
userdel git
rm -R /home/git
rm -R /var/lib/gitea/
rm -R /etc/gitea
rm /usr/local/bin/gitea
rm /etc/systemd/system/gitea.service
systemctl daemon-reload
systemctl reset-failed

