#!/bin/sh
#1. copy files into desired folder

adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git
cd /home/gitea
#download gitea binary
wget -O gitea https://dl.gitea.io/gitea/1.12.1/gitea-1.12.1-linux-amd64
wget <input gitea.service download link from git here>
#make it executable
chmod +x gitea
#verify signature
gpg --keyserver keys.openpgp.org --recv 7C9E68152594688862D62AF62D9AE806EC1592E2
gpg --verify gitea-1.12.1-linux-amd64.asc gitea-1.12.1-linux-amd64

#make directory 
mkdir -p /var/lib/gitea/{custom,data,log}
#gitea will generate ini file here for first time configuration
mkdir /etc/gitea
chmod -R 777 /var/lib/gitea
chmod -R 777 /etc/gitea
export GITEA_WORK_DIR=/var/lib/gitea/
#Copy Gitea binary to global location
cp gitea /usr/local/bin/gitea
chmod 777 /usr/local/bin/gitea

chown -R root:root /var/lib/gitea/
sh uninstall-gitea.sh
sh install-gitea.sh
service gitea status

cp gitea.service /etc/systemd/system
chmod -R 777 /etc/systemd/system/gitea.service
cd /usr/local/bin
sudo systemctl enable gitea
sudo systemctl start gitea.service
sudo systemctl status gitea.service