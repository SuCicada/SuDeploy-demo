
USERNAME ?= peng
DEPLOY_ADDRESS ?= sucicada.top
PORT ?= 22
DEPLOY_PORT ?= $(PORT)
DEPLOY_HOST ?= $(USERNAME)@$(DEPLOY_ADDRESS)
#PWD = $(shell pwd)
deploy_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
project_path := $(realpath $(deploy_path)/..)


ENVIRONMENT =  @export DEPLOY_PORT=$(DEPLOY_PORT); \
                export DEPLOY_HOST=$(DEPLOY_HOST); \
                export DEPLOY_USERNAME=$(USERNAME); \
                export DEPLOY_PASSWORD=$(DEPLOY_PASSWORD); \

python = $(ENVIRONMENT) python
call_utils = $(python) $(deploy_path)/utils.py
call_utils_0 = $(python) $(deploy_path)/utils.py  $(0)
define upload
	$(call_utils) upload $(1) $(2)
endef

define upload_root
	$(call_utils) upload --root $(1) $(2)
endef

define download
	$(call_utils) download $(1) $(2)
endef



define command
	$(call_utils) ssh $(1)
endef
#	ssh -p $(PORT) root@$(DEPLOY_ADDRESS) $(1)
#	ssh -p $(PORT) $(DEPLOY_ADDRESS) 'echo $(DEPLOY_PASSWORD) | sudo -S bash -c "$(1)"'
define ssh
	$(call_utils) ssh '$(1)'
endef
define ssh_root
	$(call_utils) ssh --root '$(1)'
endef
#	$(call_utils) upload $(1)
define ssh_file
	echo '$(2)'
	$(call_utils) ssh --file $(1) '$(2)'
endef
define ssh_root_file
	$(call_utils) ssh --root --file $(1) '$(2)'
endef


define update_root_systemd
	$(eval name := $(patsubst %,%,$(1)))
	$(eval service_file := $(patsubst %,%,$(2)))
	$(call upload_root, $(service_file), /etc/systemd/system/$(name).service)
	$(call ssh_root, systemctl daemon-reload && \
			systemctl restart $(name) && \
			systemctl status $(name) | head && \
			sleep 3 && \
			systemctl is-active $(name) \
			)
endef
define restart_root_service
	$(eval name := $(patsubst %,%,$(1)))
	$(call ssh_root, \
			systemctl restart $(name) && \
			systemctl status $(name) | head && \
			sleep 3 && \
			systemctl is-active $(name) \
			)
endef

define update_user_systemd
	$(eval name := $(patsubst %,%,$(1)))
	$(call upload, .config/systemd/user/$(name).service)
	$(call ssh, systemctl --user daemon-reload && \
			systemctl --user restart $(name) && \
			systemctl --user status $(name) | head && \
			sleep 3 && \
			systemctl --user is-active $(name) \
			)
endef

define update_merge
	$(ENVIRONMENT) sh $(deploy_path)/script/update_merge.sh $(1) $(2)
endef
