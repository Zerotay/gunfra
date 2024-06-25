#!/bin/bash

# This file works in Ubuntu 24.04.

# Set package registry to domestic mirror server
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list.d/ubuntu.sources

# apt setting
sudo apt update && sudo apt upgrade -y
sudo apt install -y git vim net-tools curl
sudo git config --global user.name "Zerotay"
sudo git config --global user.email "donggun1000@naver.com"

## installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# You have to restart terminal
nvm install 20
node -v # should print `v20.14.0`
npm -v # should print `10.7.0`

# INFO
# At least, install your vim settings archive by yourself
# It needs ssh-keygen, git settings

# Install applications
## obsidian
OBSIDIAN_VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest  | jq -r '.name')
echo $OBSIDIAN_VERSION
curl -LO https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb
sudo dpkg -i obsidian_${OBSIDIAN_VERSION}_amd64.deb
rm obsidian_${OBSIDIAN_VERSION}_amd64.deb
## chrome
curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
## vscode
curl -LO "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i download
rm download
## intellij
sudo snap install intellij-idea-ultimate --classic
## discord
sudo snap install discord
## docker, docker compose, docker swarm
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ${USER}
sudo systemctl restart docker
## virtualbox
sudo apt install -y virtualbox
## vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

# rust
# python
# pyenv
# poetry
# java?
