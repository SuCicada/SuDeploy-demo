supervisor-upload-all:
	$(call upload, etc/supervisor/)
	$(call command, "supervisorctl update")
supervisor-init:
	$(call ssh_root, "mv /etc/supervisord.conf /etc/supervisord.conf.bak && \
					ln -s /home/peng/etc/supervisor/supervisord.ini /etc/supervisord.conf
