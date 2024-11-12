#!/bin/bash
# shellcheck disable=SC2068
# 自己的服务器, 为什么要显示指定呢, 应该是考虑到: 如果本脚本没有后缀, 则名称一样的冲突?
supervisord -c ~/.config/supervisor/supervisord.ini $@
