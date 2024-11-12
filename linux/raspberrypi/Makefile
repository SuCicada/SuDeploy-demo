include ../../deploy/Makefile

USERNAME=peng
PORT=6201
#PORT=22
#DEPLOY_ADDRESS=192.168.50.175
upload:
	#./upload.sh
	$(call upload, etc/)
	$(call upload, .config/)


#restart-frpc:
#	$(call upload, .config/systemd/user/frpc.service)
#	$(call command, "systemctl --user daemon-reload && \
#					systemctl --user restart frpc && \
#					systemctl --user status frpc | head")
#
