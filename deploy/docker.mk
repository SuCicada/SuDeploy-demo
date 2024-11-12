define deploy_docker_compose
	$(eval name := $(patsubst %,%,$(1)))
	$(call upload, etc/docker/$(name)/)
	$(call ssh, "cd ~/etc/docker/$(name)/ && \
		docker compose down && docker compose up -d && docker compose restart")
endef


