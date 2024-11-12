deploy_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
project_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))/../

include $(deploy_path)/utils.mk
include $(deploy_path)/Makefile
include $(deploy_path)/nginx.mk
include $(deploy_path)/supervisor.mk
include $(deploy_path)/install.mk
include $(deploy_path)/profile.mk
include $(deploy_path)/docker.mk
include $(deploy_path)/dotenv.mk
