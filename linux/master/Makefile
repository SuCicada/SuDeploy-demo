#include ../../deploy/utils.mk
#include ../../deploy/Makefile
include ../../deploy/import.mk

USERNAME=xxxx
DEPLOY_PASSWORD=xxxxxx

upload:
	#./upload.sh
	$(call upload, etc/)
	$(call upload, .config/)


frps-restart: restart-frps
restart-frps:
	$(call upload, etc/frp/frps.ini)
	$(call upload, etc/supervisor/conf.d/frps.ini)
	$(call command, "supervisorctl update")
	$(call command, "supervisorctl restart frps")
	$(call command, "supervisorctl status frps")
	$(call command, "tail ~/var/log/supervisor/frps.log")


restart-su-action-server:
	$(call upload, etc/supervisor/conf.d/su-action-server.ini)
	$(call command, "supervisorctl stop su-action-server")
	$(call command, "supervisorctl start su-action-server")
	$(call command, "supervisorctl tail su-action-server")

define restart_server_in_supervisor
	$(eval server := $(patsubst %,%,$(1)))
	$(call upload, etc/supervisor/conf.d/$(server).ini)
	$(call command, "supervisorctl update &&\
		supervisorctl restart $(server) &&\
		supervisorctl status $(server)  | head &&\
		supervisorctl tail $(server) &&\
	")
endef

restart-sayaka_bot:
	$(call restart_server_in_supervisor, sayaka_bot)

restart-all-supervisor: upload
	$(call command, "supervisorctl update")
	$(call command, "supervisorctl restart all")
	$(call command, "supervisorctl status")

restart-supervisor:
	$(call upload, .config/systemd/user/supervisor.service)
	$(call upload, etc/supervisor/supervisord.ini)
	$(call command, "systemctl --user daemon-reload && \
					systemctl --user restart supervisor && \
					systemctl --user status supervisor | head")


passwd_txt=etc/nginx/passwd.txt
nginx-password:
	htpasswd -bdc $(passwd_txt) sucicada ilovesucicada
	sed -i '' '$d' $(passwd_txt)


_update-supervisor: update-supervisor

iptables-save: _iptables-save
iptables-restore: _iptables-restore

update-openvpn-server:
	"systemctl restart openvpn-server@server.service"

update-updns:
	$(call upload, etc/updns/)


#$(call ssh, "docker restart updns")
#$(call ssh_root, "systemctl stop systemd-resolved")
#$(call update_root_systemd, updns, etc/updns/updns.service)
#	$(call restart_server_in_supervisor, updns)

update-nftables: _update-nftables
openvpn-server-download:
	$(call download, /etc/openvpn/server/server.conf, etc/openvpn/server.conf)
openvpn-server-update:
	$(call upload_root, etc/openvpn/server.conf, /etc/openvpn/server/server.conf)
	$(call restart_root_service, openvpn-server@server)
openvpn-client-download:
	wget -O ../../macbook/etc/openvpn/peng.ovpn http://sucicada.cf:3000/mac.ovpn
	wget -O ../roketto/etc/openvpn/asus.ovpn http://sucicada.cf:3000/asus.ovpn
openvpn-client-upload:
	make -C ../../macbook openvpn-update
	make -C ../roketto update-openvpn

init-profile:
	$(eval args=--file /root/.bashrc --cmd "source ~/.root-profile" )
	$(call ssh_root_file, $(deploy_path)/script/modify_bashrc.py, $(args))
	$(call upload_root, etc/profile/.root-profile, /root/.root-profile)
	$(call upload, etc/profile/.profile, "~/.profile")

test:
	$(call upload, etc/profile/.profile, "~/.profile")
	#$(eval args=--file /etc/nftables.conf --cmd "include '/etc/nftables/*.nft'" )
	#$(call ssh_root_file, $(deploy_path)/script/modify_bashrc.py, $(args))

#$(eval args="--user asdf,asdfda -us nnn")
#$(call ssh_file, $(deploy_path)/script/modify_bashrc.py, $(args))
#echo $(deploy_path)
	#$(call ssh, "echo \$$SHELL")
	#$(call ssh, "nvm install gallium")

update-dnsmasq:
	$(call upload_root, etc/dnsmasq/dnsmasq.conf, /etc/dnsmasq.conf)
	$(call restart_root_service, dnsmasq)
