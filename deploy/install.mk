deploy_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
install-frp:
	echo $(deploy_path)
	$(eval cmd := $(shell cat $(deploy_path)/script/install-frp.sh))
	#$(call command, "$(cmd)")
	echo "$(cmd)"
install-rust:
	$(call ssh, "curl https://sh.rustup.rs -sSf | sh -s - -y")

install-nvm:
	$(call ssh, "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash")
	#$(call ssh_file, $(deploy_path)/script/modify_bashrc.py)
	$(call ssh, "nvm install 18")

install-updns:
	$(call ssh, "cargo install updns")

#download-profile:
#	$(call download, .su-profile, etc/profile/.su-profile)
