#!/bin/bash

while :;do

	status=`cat game.log|wc -l`

	case $status in

		# Süre Başlamamış, Süreyi Başlat..
		0)
			# Uygulama Seçimi:

			while :; do
				./UI.sh game
				read -e -p "Seçiminiz?  : " -i "1" game
				case $game in
					1|2|3 ) break;;
					Q|q ) exit;;
					* ) echo; echo "  Şunlardan Birini Girmelisiniz: 1, 2, Q"
					read;;
				esac
			done

			# Süre Belirleme:

			while :; do
				./UI.sh time
				read -e -p "Seçiminiz?  : " -i "10" time
				case $time in
					5|10|15|20|25 ) break;;
					Q|q ) exit;;
					* ) echo; echo "  Şunlardan Birini Girmelisiniz: 5, 10, 15, 20, 25, Q"
					read;;
				esac
			done

			# Süre Bitimindeki Aksiyonun Belirlenmesi:

			while :; do
				./UI.sh finish
				read -e -p "Seçiminiz?  : " -i "1" finish
				case $finish in
					1|2|3 ) break;;
					Q|q ) exit;;
					* ) echo; echo "  Şunlardan Birini Girmelisiniz: 1, 2, 3, Q"
					read;;
				esac
			done

			# Oyun Başlıyor:

			case $game in
				1)
					supertuxkart 2>&1 > /dev/null & 
					;;
				2)
					google-chrome 2>&1 > /dev/null & ;;
				*);;
			esac

			# Süre Başlıyor:

			./sleep.sh $time $finish > game.log &
			sleep 1		# oyunun başlaması için geçecek süre..
		;;
		
		*)
			while :; do
				./UI.sh watch
				read -e -p "Seçiminiz?  : " -i "1" watch
				case $watch in
					1)
						while 
							clear
							cat game.log
							echo $sleeping
							echo; read -e -t 1 -p "  Geri Gelmek İstiyor musunuz? [E/h]:  " -i "E" quit
							sleeping=`ps -ef|grep sleep.sh |grep -v grep |wc -l`
							case $quit in
								E|e ) break;;
								* );;
							esac
							#echo 4
							[ $sleeping -gt 0 ]
						do true; done
						echo $sleeping
						break
						;;			
					2)
						pkill sleep.sh
						> game.log
						break
						;;
					Q|q ) exit;;
					* ) echo; echo "  Şunlardan Birini Girmelisiniz: 1, 2, Q"
						read;;
				esac
			done
		;;

	esac	
done
