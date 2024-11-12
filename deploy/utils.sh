#!/bin/bash

port=${port:-22}

upload(){
  scp -P $port -r $1 $username@sucicada.cf:~/$2
}
command(){
  ssh -p $port $username@sucicada.cf $@
}
echo ~~~~~~~~
echo $@
