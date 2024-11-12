curl -fsSL https://get.docker.com | sh
sudo usermod -aG root $(whoami)

sudo apt-get install -y ruby-full vim awscli openssh-server tree \
  make python3-pip

echo ". /home/circleci/profile" >> /home/circleci/.bashrc

#sudo rm -rf /var/lib/apt/lists/*

