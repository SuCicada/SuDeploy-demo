#!/bin/bash
# shellcheck disable=SC2068
supervisorctl -c ~/.config/supervisor/supervisord.ini $@
