```bash
systemctl start frps.service
systemctl enable frps
```


docker run -it --restart=always --name peng --cap-add=NET_ADMIN --device /dev/net/tun ubuntu-peng
