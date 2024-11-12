get-zshrc:
	$(call download, .zshrc, etc/profile/.zshrc)
update-zshrc:
	$(call update_merge, etc/profile/.zshrc, .zshrc)

get-p10k:
	$(call download, .p10k.zsh, etc/profile/.p10k.zsh)
nupdate-p10k:
	$(call upload, etc/profile/.p10k.zsh, .p10k.zsh)

update-tmux:
	$(call upload, etc/profile/.tmux.conf, .tmux.conf)

update-zellij:
	$(call upload, .config/zellij/config.kdl, .config/zellij/config.kdl)
