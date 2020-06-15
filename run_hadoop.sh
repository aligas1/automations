#!/bin/sh
# issues with varible! on blank server thinks this is filepath

cd /opt

# chmod to allow mkdir
export sudo_pw = 1234
sudo chmod 777 . < $sudo_pw

wget http://mirrors.advancedhosters.com/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz
sudo tar xzf hadoop-2.8.5.tar.gz
sudo rm hadoop-2.8.5.tar.gz

# link hadoop dir to the hadoop-verion
sudo ln -s hadoop-2.8.5 hadoop

cd ~

# set path in bash profile
echo "
export HADOOP_HOME=/opt/hadoop
export HADOOP_INSTALL=\$HADOOP_HOME
export HADOOP_MAPRED_HOME=\$HADOOP_HOME
export HADOOP_COMMON_HOME=\$HADOOP_HOME
export HADOOP_HDFS_HOME=\$HADOOP_HOME
export YARN_HOME=\$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native
export PATH=\$PATH:\$HADOOP_HOME/bin
export PATH=\$PATH:\$HADOOP_HOME/sbin
export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"" >> .bash_profile

source .bash_profile

echo "set path in bash_profile"

cd /opt/hadoop/etc/hadoop

# edit configuration files 

# set path for java and hadoop conf dir in hadoop-env.sh
sed -i '/export JAVA_HOME/ s/${JAVA_HOME}/\/opt\/jdk1.8.0_221/' hadoop-env.sh
sed -i '/export HADOOP_CONF_DIR/ s/${HADOOP_CONF_DIR:-"\/etc\/hadoop"}/\/opt\/hadoop\/etc\/hadoop/' hadoop-env.sh

echo "changing hadoop-env.sh"

# remove the <\configuration> line from core-site.xml
sed -i '/<\/configuration>/d' core-site.xml
echo "
<property>
    <name>hadoop.tmp.dir</name>
    <value>/opt/hadoop/tmp</value>
</property>
<property>
    <name>fs.defaultFS</name>
    <value>hdfs://localhost:50501</value>
</property>
</configuration>" >> core-site.xml

# go back to hadoop home and create dir for conf files & hdfs files
cd /opt/hadoop

# chmod to allow mkdir
sudo chmod 777 . < $sudo_pw

mkdir tmp

# create namenode and datanode directories in hdfs
mkdir -p hdfs/namenode
mkdir -p hdfs/datanode

# conf hdfs-site.xml, remove </configuration> line
cd etc/hadoop
sed -i '/<\/configuration>/d' hdfs-site.xml
echo "
<property>
<name>dfs.replication</name>
<value>1</value>
<name>dfs.name.dir</name>
<value>file:///opt/hadoop/hdfs/namenode</value>
<name>dfs.data.dir</name>
<value>file:///opt/hadoop/hdfs/datanode</value>
</property>
</configuration>" >> hdfs-site.xml

# chmod to allow mkdir
sudo chmod 777 . < $sudo_pw

# cp mapred tempalte to mapred-site.xml and add conf
cp mapred-site.xml.template mapred-site.xml
sed -i '/<\/configuration>/d' mapred-site.xml
echo "
<property>
<name>mapreduce.framework.name</name>
<value>yarn</value>
</property>
</configuration>" >> mapred-site.xml

# edit yarn-site.xml
sed -i '/<\/configuration>/d' yarn-site.xml
echo "
<property>
<name>mapreduceyarn.nodemanager.aux-services</name>
<value>mapreduce_shuffle</value>
</property>
</configuration>" >> yarn-site.xml

# format hdfs
hdfs namenode -format
