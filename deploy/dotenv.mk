update-dotenv:
	$(call upload, "$(project_path)/common/etc/env/.env*", ~/etc/env/)