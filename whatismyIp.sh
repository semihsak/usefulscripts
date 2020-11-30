#!/bin/bash
<<<<<<< HEAD
# This script get your public ip
# Opendns uses resolve{1..4} dns servers it should keep your public ip
=======
# This script get your public and local ip
#opendns uses resolve{1..4} dns servers it should keep your public ip

>>>>>>> 0f1069fd39b0d76cbaaf67c399c8f3fe523e052a

error(){
  echo -e "$0 invalid option -- $1"
  echo -e "Try '$0 --help' for more information"
}


gethelp(){
  echo 'This script allow to know your public and local ip address|addresses'
  echo 'Usage: ./whatismyIP.sh [OPTION]..'
  echo 'Mandatory arguments to long options are mandatory for short options too.'
  echo -e "-p, --public \t get your public ip address from opendns query"
  echo -e "-l, --local \t get your local ip address|addresses"
  echo -e "-h, --help \t display this help and exit"
<<<<<<< HEAD
=======
  echo -e "-l, --local \t get your local ip address/addresses"

>>>>>>> 0f1069fd39b0d76cbaaf67c399c8f3fe523e052a
}

getpublic(){
for i in `seq 4`
do
    dig myip.opendns.com @resolver$i.opendns.com +short
done
}

getlocal(){
  hostname -I
}


while true;
do
  case "$1" in
  -p| --public) getpublic; break;;
  -h| --help) gethelp; break;;
  -l| --local) getlocal; break;;
  * ) error; break;;
  esac
done

