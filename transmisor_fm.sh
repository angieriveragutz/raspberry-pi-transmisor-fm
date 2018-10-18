#!/bin/bash
#emisor de fm
clear
echo "este programa permite hacer un transmisor fm"
echo ""
echo "===menu del instalador==="
PS3='sleccione que quiere hacer:'
opciones=("opcion1 instalar transmisor fm." "opcion2 desinstalar transmisor fm." "opcion 3 acerca de." "opcion 4 salir.")
select pez in "${opciones[@]}"
do
    case $pez in
    "opcion1 instalar instalar transmisor fm." )
        echo "seleccionaste la opcion 1"
        sudo apt-get -y update
        sudo apt-get -y upgrade
        git clone https://github.com/rm-hull/pifm
        cd pifm
        sudo make
        sudo apt-get -y install mpg123
        sudo /usr/bin/mpg123 -4 -s -Z /home/pi/Music/* | sudo /home/pi/pifm/pifm - 91.1
        ;;
    "opcion2 desinstalar transmisor fm." )
      echo "elegiste la opcion 2"
      sudo apt-get -y remove mpg123
      sudo apt-get -y purge mpg123
      sudo apt-get -y clean mpg123
      cd
      sudo rm -R pifm
      ;;
    "opcion 3 acerca de." )
      echo "elegiste la opcion 3"
      echo "Copyright (C) 18 de octubre 2018  Angelica"
      ;;
    "opcion 4 salir." )
      echo "elegiste la opcion 4"
      break
      ;;
   *) echo opcion invalida;;
 esac
done
