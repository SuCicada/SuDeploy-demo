# nginx
- 记得在 nginx.conf 加
  include /home/peng/etc/nginx/*;

## set cname with cloudflare
设置了cname，记得nginx的 server_name 也要更改

~~## openvpn~~
~~wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh~~


# nftables
- 记得在 /etc/nftables.conf 加
  include /home/peng/etc/nftables/my.nft;

# root: .bashrc
加入
```bash
export NVM_DIR="/home/peng/.nvm"                                                                                     
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=$PATH:/home/peng/.cargo/bin/
```


# docker
sudo vim /etc/docker/daemon.json
```json
{
"hosts": ["unix:///var/run/docker.sock", "tcp://0.0.0.0:2375"]
}
```
sudo systemctl restart docker



