#!/bin/sh
yum -y install python-setuptools
sudo easy_install shadowsocks
echo -e '{"server":"\c' > /etc/shadowsocks.json
echo -e $1'\c' >> /etc/shadowsocks.json
echo -e '","server_port":25,"local_address":"127.0.0.1","local_port":1080,"password":"ssspassword","timeout":300,"method":"aes-256-cfb","fast_open":false}'  >> /etc/shadowsocks.json
systemctl stop firewalld
ssserver -c /etc/shadowsocks.json -d start

