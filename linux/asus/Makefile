#include ../../deploy/Makefile
include ../../deploy/import.mk
include docker.mk

USERNAME=xxxxxxxxx
DEPLOY_ADDRESS=mxxxx
DEPLOY_PASSWORD=xxxx
# upload:
# 	#./upload.sh
# 	$(call upload, etc/)
# 	$(call upload, .config/)

update-app:
	$(call upload, APP/go-cqhttp/)
	$(call upload, APP/minecraft/)



grafana-backup:
	grafana-backup save --config etc/grafana/grafana_backup.json
test:
	echo $(MAKEFILE_LIST)
	$(call upload_root, .config/systemd/user/frpc.service, /root/frpc.service)

update-nginx-pem:
	$(call upload, etc/nginx/_wildcard.server.sucicada.me.pem, etc/nginx/)
	$(call upload, etc/nginx/_wildcard.server.sucicada.me-key.pem, etc/nginx/)

cmd:
	$(call download, .config/zellij/config.kdl)
