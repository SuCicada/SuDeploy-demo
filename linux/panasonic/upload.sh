upload(){
  scp -P 6000 -r $1 xxxxxxxxx:~/$2
}
command(){
  ssh -p 6000 xxxxxxxxxxxxx $@
}
#upload home/sucicada/etc/frp/frpc.ini
#upload home/sucicada/etc/systemd/system/frpc.service
upload etc/
command "echo sucicada | sudo -S systemctl daemon-reload"
