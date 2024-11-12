docker-update-monitor:
	$(call upload, etc/docker/monitor/)
	$(call ssh, "cd ~/etc/docker/monitor/ && \
			docker compose up -d && docker compose restart")
docker-update-supervisord-monitor:
	$(call upload, etc/docker/supervisord-monitor/)
	$(call ssh, "docker run -itd -p xxx:xxxxx \
				--name supervisor-monitor \
				-v ~/etc/docker/supervisord-monitor/supervisor.php:/app/application/config/supervisor.php \
				sucicada/supervisord-monitor:latest")

docker-rocket-chat:
	$(call upload, etc/docker/rocket-chat/)
	$(call ssh, "cd etc/docker/rocket-chat/ && \
			docker compose --env-file .env up -d && \
			docker compose restart")

docker-open-webui:
	$(call deploy_docker_compose, open-webui)


docker-navidrome:
	$(call upload, etc/docker/navidrome/)
	$(call ssh, "cd ~/etc/docker/navidrome/ && \
			docker compose down && docker compose up -d && docker compose restart")

define deploy_docker_compose
	$(eval name := $(patsubst %,%,$(1)))
	$(call upload, etc/docker/$(name)/)
	$(call ssh, "cd ~/etc/docker/$(name)/ && \
		docker compose down && docker compose up -d && docker compose restart")
endef

docker-feishin:
	$(call deploy_docker_compose, feishin)

docker-vaultwarden:
	$(call deploy_docker_compose, vaultwarden)
docker-portainer-ce:
	$(call deploy_docker_compose, portainer-ce)

backup-apprise:
	$(call download, etc/apprise/)
docker-apprise:
	$(call upload, etc/apprise/)
	$(call deploy_docker_compose, apprise)

docker-infisical:
	$(call deploy_docker_compose, infisical)

docker-circleci:
	$(call deploy_docker_compose, circleci)
