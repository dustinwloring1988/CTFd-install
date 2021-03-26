!#/bin/sh
apt update
git clone https://github.com/CTFd/CTFd.git
cd CTFd
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential python-dev python-pip python3-pip libffi-dev docker.io docker-compose
pip3 install -r requirments.txt
pip3 install flask 
apt update
apt upgrade -y
doker-compose up
docker volume create portainer_data
docker run -d -p 8011:8000 -p 9011:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
cd CTFd/plugins
git clone https://github.com/offsecginger/CTFd-Docker-Challenges.git
cd CTFd-Docker-Challenges
cp docker-challange ..
rm -rf CTFd-Docker-Challenges
# Completed Install Yay _ ALSO MAKE SURE TO RUN AS ROOT OR SUDO THIS
