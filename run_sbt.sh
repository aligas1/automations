#!/bin/sh

# install in /opt
cd /opt

# wget sbt, unzip file and remove
sudo wget https://piccolo.link/sbt-1.2.7.zip
sudo unzip sbt-1.2.7.zip
sudo rm sbt-1.2.7.zip

# move to home dir, define path for SCALA_HOME in bash_profile
cd ~
echo "
export SBT_HOME=/opt/sbt
export PATH=\$PATH:\$SBT_HOME/bin" >> .bash_profile

source .bash_profile
