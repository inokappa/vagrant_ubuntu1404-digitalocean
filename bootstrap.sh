#!/bin/bash

sudo apt-get update
sudo apt-get -qq -y install unzip openjdk-7-jdk

if [ ! -f /home/vagrant/apache-jmeter-2.13/bin/jmeter ];then
  cd /home/vagrant/
  wget -q http://ftp.riken.jp/net/apache//jmeter/binaries/apache-jmeter-2.13.zip
  unzip -q apache-jmeter-2.13.zip
  chmod +x /home/vagrant/apache-jmeter-2.13/bin/jmeter
fi

if [ ! -d /vagrant/result ];then
  mkdir /vagrant/result
fi

sleep 10

# JMeter Running?
ps aux | grep \[A]pacheJMeter
if [ $? = "0" ];then
  pkill java  
  /home/vagrant/apache-jmeter-2.13/bin/jmeter -n -t /vagrant/oreno-thread.jmx -Jmeter.save.saveservice.output_format=xml -l /vagrant/result/result.jtl
else
  /home/vagrant/apache-jmeter-2.13/bin/jmeter -n -t /vagrant/oreno-thread.jmx -Jmeter.save.saveservice.output_format=xml -l /vagrant/result/result.jtl
fi
