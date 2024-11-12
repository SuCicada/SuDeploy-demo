
update-nginx: nginx-update
nginx-update:
	$(call upload, etc/nginx/sites/)
	$(call ssh_root, "nginx -s reload")

nginx-pull:
	$(call download, /etc/nginx/nginx.conf, etc/nginx/nginx.conf)
nginx-conf-update:
	$(call upload_root, etc/nginx/nginx.conf, /etc/nginx/nginx.conf)
	$(call ssh_root, "nginx -s reload")
