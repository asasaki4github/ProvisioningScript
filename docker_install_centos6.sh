#!/bin/bash

# Disable tunnelled clear text passwords
sed -i.org -e "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
service sshd restart

# Change to Japanese locale
yum -y groupinstall "Japanese Support"
sed -i.org -e "s/en_US.UTF-8/ja_JP.UTF-8/g" /etc/sysconfig/i18n

# Change to JST time zone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Install Docker
sudo rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
sudo yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum -y install docker-io
sudo service docker start
sudo chkconfig docker on

# Install basic tools
yum install -y gcc gcc-c++ bison flex m4 glibc-devel glibc-devel.i686 zlib-devel git > /tmp/yum.log 2>&1

# Configure Linux Firewall
# --- CAUTION --- Change to deny access from public address
iptables -P INPUT DROP
# iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth1 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -s 10.0.0.0/14 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -p all -j REJECT
service iptables save
shutdown -r now
