!#/bin/sh
apt update
git clone https://github.com/CTFd/CTFd.git
cd CTFd
apt install -y docker.io docker-compose python3-pip libffi-dev
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential python-dev
pip3 install -r requirments.txt
pip3 install flask 
apt update
docker-compose up
docker volume create portainer_data
docker run -d -p 8011:8000 -p 9011:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce --templates https://raw.githubusercontent.com/dustinwloring1988/templates/master/pentest
cd CTFd/plugins
git clone https://github.com/offsecginger/CTFd-Docker-Challenges.git
cd CTFd-Docker-Challenges
cp docker_challanges ..
rm -rf CTFd-Docker-Challenges
# Completed Install Yay _ ALSO MAKE SURE TO RUN AS ROOT OR SUDO THIS
# curl https://raw.githubusercontent.com/dustinwloring1988/CTFd-install/main/install.sh | sudo sh
