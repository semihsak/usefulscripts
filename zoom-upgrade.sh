# Author: Semih Sak
# This script helps to keep up-to-date zoom client on your debian system
# License MIT

#/!bin/bash

check_system() {
  MACHINE_TYPE=$(uname -m)
    if [ ${MACHINE_TYPE} == 'x86_64' ];
      then
        echo "amd64"
      else
        echo "i386"        
    fi
}

get_zoom(){
  wget -q https://zoom.us/client/latest/zoom_$(check_system).deb -O ./zoom_$(check_system).deb
}

install(){  
  sudo dpkg -i ./zoom_$(check_system).deb
  sudo apt install -f
  rm ./zoom_$(check_system).deb
}

checklatest(){
  get_zoom
  ver="$(dpkg-deb -I ./zoom_$(check_system).deb | grep -w Version | cut -d ":" -f2)"
  echo $ver
}

zoom_version=$(dpkg -l | grep zoom | awk -F " " '{print $3}')

if [ -z $zoom_version ];
  then
    echo "Zoom is not installed on your system"
    echo "Starting first install"
    get_zoom
    install
  else
    echo "Zoom installed your system version is $zoom_version"
    echo "Checking newer version of zoom"
      if [ $zoom_version != $(checklatest) ];
        then
          echo "Zoom update starting"
          install
          echo "Newer version of Zoom installed."
          rm ./zoom_$(check_system).deb
          echo "Zoom deb file successfuly removed"
        else
      echo "You have already use latest version of zoom, no upgrade needed"
      rm ./zoom_$(check_system).deb
      echo "Downloaded file removed"
    fi
fi