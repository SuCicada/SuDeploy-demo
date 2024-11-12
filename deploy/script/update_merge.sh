#!/bin/bash
src=$1
target=$2

python_utils(){
  echo python_utils "$@"
  python $(dirname $0)/../utils.py "$@"
}
temp=/tmp/suconfig-update_merge-temp
python_utils download $target $temp


diffmerge $temp $src

read -p "$1 (yes/NO): " yn; \
  case $yn in  \
  [Yy]* )   python_utils upload $src $target ;; \
  * ) echo $yn "skip";; \
esac
