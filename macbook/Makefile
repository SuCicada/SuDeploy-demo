include ../deploy/import.mk

.PHONY: update launch

USERNAME=xxxx
DEPLOY_ADDRESS=localhost
#DEPLOY_PASSWORD=pengeman

update:
	cp -r bin/ ~/bin/
	make update-supervisor
	make update-launch
#update-supervisor:
#	cp -r .config/ ~/.config/
#	supervisorctl.sh update
#	supervisorctl.sh restart all

update-launch: ~/Library/LaunchAgents/com.peng.supervisord.plist
~/Library/LaunchAgents/com.peng.supervisord.plist:
	plutil -lint launch/com.peng.supervisord.plist
	cp plist/* ~/Library/LaunchAgents/
	chmod 664 ~/Library/LaunchAgents/com.peng.supervisord.plist
	launchctl unload ~/Library/LaunchAgents/com.peng.supervisord.plist
	launchctl load -w ~/Library/LaunchAgents/com.peng.supervisord.plist

launch:
	#launchctl print user/501/
	launchctl print gui/501/com.xxx.supervisord

openvpn-download:
	wget -O etc/openvpn/peng.ovpn http://sucicada.cf:3000/mac.ovpn

openvpn-upload:
	"/Applications/OpenVPN Connect/OpenVPN Connect.app/Contents/MacOS/OpenVPN Connect" \
		--import-profile=$(project_path)/macbook/etc/openvpn/peng.ovpn \
		--name="xx.xx [xx]"

test:
	$(call ssh, pwd)

#update-dotenv:
	#cp ../common/etc/env/* ~/etc/env/