#!/bin/sh

# install kafka in /opt
cd /opt

# get Kafka, unzip file and remove
sudo wget http://apache.mirrors.hoobly.com/kafka/2.3.1/kafka_2.12-2.3.1.tgz
sudo tar -xzvf kafka_2.12-2.3.1.tgz
sudo rm kafka_2.12-2.3.1.tgz

#alias Kafka

sudo ln -s kafka_2.12-2.3.1 kafka

# cd home dir
cd ~

# define path for KAFKA_HOME
echo "
export KAFKA_HOME=/opt/kafka
export PATH=$PATH:$KAFKA_HOME/bin " >> .bash_profile
  
source .bash_profile
