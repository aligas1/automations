#!/bin/sh

# Java 1.8

# install java in /opt
cd ~
cd /opt

echo "1234" > pw.txt

# get Java 8, unzip file and remove 
sudo apt install openjdk-8-jdk-headless openjre-8-headless < pw.txt
sudo tar -xzvf jdk-8u221-linux-x64.tar.gz < pw.txt
sudo rm jdk-8u221-linux-x64.tar.gz < pw.txt

rm pw.txt

# move to home dir, adjust .bashrc
cd ~
echo "
source ~/.bash_profile
" >> .bashrc

# define path for JAVE_HOME
echo "
export JAVA_HOME=/opt/jdk1.8.0_221
export PATH=\$PATH:\$JAVA_HOME/bin " >> .bash_profile
  
source .bash_profile
