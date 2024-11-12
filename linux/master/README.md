
```bash

#service=/etc/systemd/system/multi-user.target.wants/supervisor.service
#sudo mv $service $service.old
#sudo ln -s /home/peng/etc/systemd/system/supervisor.service $service
#ll $service


sudo systemctl disable supervisor.service
```
```bash
systemctl --user daemon-reload
systemctl --user restart supervisor
systemctl --user status supervisor | head

````

