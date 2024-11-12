port=6001
username=peng

. ../deploy/utils.sh

upload etc/
command "echo pengeman | sudo -S systemctl daemon-reload"
command "echo pengeman | sudo -S systemctl reload frpc"

