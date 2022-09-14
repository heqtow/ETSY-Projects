#!/bin/bash

echo "  Başlangıç Saati: " `date +%F--%T`
echo

time=$1
finish=$2

# Süre Başlıyor:

while [ $time -gt 0 ]
do
  echo "  "`date +%F--%T` - $time Dakika Kaldı
  #sleep 1
  sleep 1m
  time=$(( $time - 1 ))
done

# Süre Bitimindeki Aksiyonun Uygulanması:

case $finish in
  1)
    > game.log
    #echo "Oyun Bitti!"
    xflock4
  ;;
  2)
    > game.log
    xfce4-session-logout --logout
  ;;
  3)
    > game.log
    shutdown -fh now
  ;;
esac
