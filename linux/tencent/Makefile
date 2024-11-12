#include ../../deploy/Makefile
include ../../deploy/import.mk


DEPLOY_ADDRESS=xxxxxx
USERNAME=xxxxx
PORT=xxxx
DEPLOY_PASSWORD=xxxxxxxx

update-frps:
	$(call upload_root, etc/frp/frps.toml)
	$(call update_root_systemd, frps, .config/systemd/user/frps.service)


#./upload.sh
	#$(call upload_root, etc/openvpn/server.conf, /etc/openvpn/server/server.conf)
	#$(call upload, .config/)


docker-rocket-chat:
	$(call upload, etc/docker/rocket-chat/)
	$(call ssh, "cd etc/docker/rocket-chat/ && \
			docker compose --env-file .env up -d && \
			docker compose restart")
