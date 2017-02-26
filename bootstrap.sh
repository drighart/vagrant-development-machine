#!/usr/bin/env bash

# install the latest updates on ubuntu
sudo apt-get update
sudo apt-get -y upgrade

sudo locale-gen "en_US.UTF-8"
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# install docker
apt-get install -y docker.io
sudo groupadd docker
sudo gpasswd -a vagrant docker
sudo service docker restart

# install CLI Kubernetes
if [ ! -f "/usr/local/bin/kubectl" ];
then
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
	rm kubectl
fi

# install CLI Helm
if [ ! -f "/usr/local/bin/helm" ];
then
	curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
	chmod 700 get_helm.sh
	./get_helm.sh
	rm get_helm.sh
fi

sudo apt-get install -y zsh
su --login vagrant
curl -sL zplug.sh/installer | zsh

mkdir ~/powerline-fonts
cd ~/powerline-fonts
git clone https://github.com/powerline/fonts.git .
./install.sh

sudo apt-get install -y dos2unix

sudo apt-get install -y default-jdk
sudo apt-get install -y maven
sudo apt-get install -y gradle

