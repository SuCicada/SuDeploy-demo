deploy_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

info:
	@echo USERNAME:  $(USERNAME)
	@echo DEPLOY_ADDRESS:  $(DEPLOY_ADDRESS)
	@echo DEPLOY_PORT:  $(DEPLOY_PORT)
	@echo DEPLOY_HOST:  $(DEPLOY_HOST)
	@echo DEPLOY_PASSWORD:  $(DEPLOY_PASSWORD)

update-frpc:
	$(call upload, etc/frp/)
	$(call upload, .config/systemd/user/frpc.service)
	$(call command, "systemctl --user daemon-reload && \
					systemctl --user reload frpc && \
					systemctl --user status frpc | head")

update-supervisor-service:
	$(call upload, etc/supervisor/)
	$(call upload, .config/systemd/user/supervisor.service)
	$(call command, "systemctl --user daemon-reload && \
					systemctl --user reload supervisor && \
					systemctl --user status supervisor | head \
					")

update-supervisor:
	$(call upload, etc/supervisor/)
#	git submodule update --recursive
#	$(call upload, .config/systemd/user/supervisor.service)
	$(call command, " \
					supervisorctl update && \
					supervisorctl status | cat \
					")

update-crontab:
	$(call upload, etc/crontab/)
	$(call command, "crontab ~/etc/crontab/crontab.txt &&\
					crontab -l \
					")

	#$(call upload_root, etc/openvpn/)

update-openvpn:
	$(call upload, etc/openvpn/)
	$(call update_root_systemd, openvpn, etc/openvpn/openvpn.service)

iptables_config := etc/iptables/iptables.sh
_iptables-save:
	$(call command, "mkdir -p ~/etc/iptables")
	$(call command_root, "iptables-save > ~/$(iptables_config)")
	$(call download, $(iptables_config))

_iptables-restore:
	$(call upload, $(iptables_config))
	$(call command_root, "iptables-restore < ~/$(iptables_config)")
	#$(call command_root, "nft -f etc/nftables/*.nft")

_update-nftables: nftables-update
nftables-update:
	#$(call ssh_root_file, $(deploy_path)/script/modify_bashrc.py, $(args))
	$(call upload_root, "etc/nftables/nftables.conf", /etc/nftables.conf)
	$(call upload_root, "etc/nftables/*.nft", /etc/nftables/)
	$(call restart_root_service, nftables)
nftables-download:
	$(call download, /etc/nftables.conf, etc/nftables/nftables.conf)

#update-tmux:
#	$(call upload, etc/tmux/.tmux.conf, .tmux.conf)
#	$(call ssh, "tmux source-file ~/.tmux.conf")

upload:
	$(call upload, $(ori), $(dst))