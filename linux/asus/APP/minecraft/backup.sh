#!/bin/bash

# 设置AWS秘钥

export RESTIC_PASSWORD="lain"
RESTIC_REPOSITORY_LOCAL="/home/peng/xxxxxxxxx/minecraft/backups"
#https://pengyifu.s3.amazonaws.com/minecraft/lain/
# 初始化AWS作为后端的存储库
#restic init

# 设置同步时间时区
#restic init -o s3.region="us-east-1"
#restic -r . copy --repo2 s3:s3.amazonaws.com/pengyifu/minecraft/lain/

minecraft_path="/home/peng/APP/minecraft/1.20"

#for target in {$RESTIC_REPOSITORY_LOCAL,$RESTIC_REPOSITORY_S3};do
restic -r $RESTIC_REPOSITORY_LOCAL forget --keep-last 10 --prune
restic -r $RESTIC_REPOSITORY_LOCAL backup $minecraft_path

#restic -r $RESTIC_REPOSITORY_S3 forget --keep-last 3 --prune
#restic -r $RESTIC_REPOSITORY_S3 backup $minecraft_path
#done
