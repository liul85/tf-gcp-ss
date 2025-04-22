#!/usr/bin/env sh
set -e

sudo apt-get update
sudo apt install -y shadowsocks-libev
sudo systemctl enable shadowsocks-libev
sudo systemctl start shadowsocks-libev

cat << EOCFG | sudo tee /etc/shadowsocks-libev/config.json
{
    "server":"0.0.0.0",
    "server_port":443,
    "local_port":1080,
    "password":"${password}",
    "timeout":60,
    "method":"aes-256-cfb"
}
EOCFG

sudo systemctl restart shadowsocks-libev

