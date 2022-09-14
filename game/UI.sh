#!/bin/bash

clear

case $1 in

	watch)
		echo
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **         Süre Başladı..                                 **"
		echo "   **                                                        **"
		echo "   **      1. Son Durum (Default)                            **"
		echo "   **                                                        **"
		echo "   **      2. Süreyi Bitir                                   **"
		echo "   **                                                        **"
		echo "   **      Q. Çıkış                                          **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo
	;;
		
	game)
		echo
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **         Lütfen Birini Seçiniz:                         **"
		echo "   **                                                        **"
		echo "   **       1. SuperTuxKart (Default)                        **"
		echo "   **                                                        **"
		echo "   **       2. Google Chrome                                 **"
		echo "   **                                                        **"
		echo "   **       3. Birşey Açma                                   **"
		echo "   **                                                        **"
		echo "   **       Q. Çıkış                                         **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo
	;;

	time)
		echo
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **         Kaç Dakika?:                                   **"
		echo "   **                                                        **"
		echo "   **       5 - 10 - 15 - 20 - 25                            **"
		echo "   **                                                        **"
		echo "   **       Q. Çıkış                                         **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo
	;;

	finish)
		echo
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **         Süre Bitince Ne Olacak?:                       **"
		echo "   **                                                        **"
		echo "   **       1. Ekran Kilitlensin (Default)                   **"
		echo "   **                                                        **"
		echo "   **       2. Oturum Kapansın                               **"
		echo "   **                                                        **"
		echo "   **       3. Bilgisayar Kapansın                           **"
		echo "   **                                                        **"
		echo "   **       Q. Çıkış                                         **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   **                                                        **"
		echo "   ************************************************************"
		echo "   ************************************************************"
		echo
	;;

	*)
	;;
	
esac