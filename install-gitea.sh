#!/bin/sh

adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git
#cd /home/git
#download gitea binary
wget -O gitea https://dl.gitea.io/gitea/1.12.1/gitea-1.12.1-linux-amd64
#make it executable
chmod +x gitea
#verify signature
#gpg --keyserver keys.openpgp.org --recv 7C9E68152594688862D62AF62D9AE806EC1592E2
#gpg --verify gitea-1.12.1-linux-amd64.asc gitea-1.12.1-linux-amd64
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
#chown -R root:root /var/lib/gitea/
cp gitea.service /etc/systemd/system
chmod -R 777 /etc/systemd/system/gitea.service
cd /usr/local/bin
sudo systemctl enable gitea
sudo systemctl start gitea.service
sudo systemctl status gitea.service
