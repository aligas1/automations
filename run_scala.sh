
#!/bin/bash

# move to opt dir
cd /opt

# install scala in /opt
sudo wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz
sudo tar -xzvf scala-2.11.8.tgz
sudo rm scala-2.11.8.tgz
 
# move to home dir
cd ~

# define path for SCALA_HOME
echo "
export SCALA_HOME=/opt/scala-2.11.8
export PATH=\$PATH:\$SCALA_HOME/bin" >> .bash_profile
