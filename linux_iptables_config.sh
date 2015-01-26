#!/bin/bash
# Configure Linux Firewall
*filter
iptables -P INPUT DROP [0:0]
iptables -P FORWARD DROP [0:0]
iptables -P OUTPUT ACCEPT [0:0]
iptables -A INPUT -i eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth1 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 icmp -j ACCEPT
service iptables save
