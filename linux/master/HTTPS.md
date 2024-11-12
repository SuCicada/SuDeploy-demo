```bash
host="*.sucicada.cf" 

acme.sh --issue -d "$host" --nginx

nginx_ssl=/etc/nginx/ssl/$host
mkdir -p $nginx_ssl
acme.sh --install-cert -d "$host" \
--key-file       $nginx_ssl/key.pem  \
--fullchain-file $nginx_ssl/cert.pem \
--reloadcmd     "service nginx force-reload"


```
