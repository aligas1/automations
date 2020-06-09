#!/bin/sh

# Java 1.8

# install java in /opt
cd ~
cd /opt

# change permissions mode Note, not reccomended to use 777 in production
sudo chmod 777 .

# answer Yes to Are you sure type questions.
echo "y" > Yes.txt

# install openssh
sudo apt install openssh-server openssh-client -y

# install Java 8 on Ubuntu 18.04
sudo apt install openjdk-8-jdk-headless < Yes.txt

# move to home dir, adjust .bashrc
cd ~
echo "
source ~/.bash_profile
" >> .bashrc

# define path for JAVE_HOME
echo "
export JAVA_HOME=/usr/bin/java
export PATH=\$PATH:\$JAVA_HOME/bin " >> .bash_profile
  
source .bash_profile
