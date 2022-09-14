#!/bin/bash

for order in ./INPUTS/*.html
do

  name=$(cat $order     |sed 's/name">/name">\n/g'              |grep country-name|cut -d"<" -f1)
  address1=$(cat $order |sed 's/first-line">/first-line">\n/g'  |grep country-name|cut -d"<" -f1)
  address2=$(cat $order |grep "second-line"|sed 's/second-line">/second-line">\n/g'|grep country-name|cut -d"<" -f1)
  city=$(cat $order     |sed 's/city">/city">\n/g'              |grep country-name|cut -d"<" -f1)
  state=$(cat $order    |sed 's/state">/state">\n/g'            |grep country-name|cut -d"<" -f1)
  zip=$(cat $order      |sed 's/zip">/zip">\n/g'                |grep country-name|cut -d"<" -f1)
  country=$(cat $order  |sed 's/name">/name">\n/g'              |grep country-name -A1|tail -1|cut -d"<" -f1)
  mail=$(cat $order     |sed "s/<a/<a\n/g"                |grep mailto|cut -d\" -f4|cut -d: -f2|sort|uniq -c|sort|tail -1|cut -d" " -f8)
  subtotal=$(cat $order |sed "s/<li class/\n<li class/g"  |grep "Subtotal"|cut -d$ -f2|cut -d"<" -f1)
  shipping=$(cat $order |sed "s/<li class/\n<li class/g"  |grep "Shipping price"|cut -d$ -f2|cut -d"<" -f1)
  tax=$(cat $order      |sed "s/li>/li>\n/g"              |grep "Tax&"|sed "s/div>/div>\n/g"|grep text-right|cut -d"$" -f2|cut -d"<" -f1)
  sku1=$(cat $order     |sed "s/SKU:/\nSKU:/g"            |grep "SKU:"|cut -d"<" -f2|cut -d">" -f2)
  quantity1=$(cat $order|sed 's/td>/td>\n/g'              |grep col-xs-2|tail -1|cut -d"<" -f3|cut -d">" -f2)
  seller=$(if [ $(echo $sku1|cut -d" " -f1) = "GG" ] ; then echo Golden Gate; else echo WAI; fi)
  echo
  echo

  #ALICI / MÜŞTERİ ADI	ÜLKE	İHRACAT TÜRÜ	KARGO FİRMASI	BAYİ/SATICI KODU	FATURA TARİHİ	FATURA NO	FATURA BEDELİ	PARA BİRİMİ	KUR (TL)	ÜRÜN	PAKET ÖLÇÜ	KARGO BEDELİ	PAKET SAYISI	SATIŞ PLATFORMU	DİĞER MALİYETLER	TOPLAM MALİYET		PHONE	ADDRESS1	ADDRESS2	EMAIL	IOSS	month

#  echo "$order ; $name ; $address1 ; $address2 ; $city ; $state ; $zip ; $country ; $mail ; $subtotal ; $shipping ; $tax ; $sku1 ; $quantity1  ; $seller"

  echo "    file: $order"
  echo "    Name: $name"
  echo "    Address 1: $address1"
  echo "    Address 2: $address2"
  echo "    City: $city"
  echo "    State: $state"
  echo "    Zip Code: $zip"
  echo "    Country: $country"
  echo "    mail: $mail"
  echo "    Subtotal: $subtotal"
  echo "    Shipping price: $shipping"
  # subtotal ve shipping price toplanacak:
  echo "    Invoice price: ?" 
  echo "    TAX: $tax"
  # IOSS  ülkeye göre otomatik getirilmeli ETSY sayfasında her zaman olmayabiliyor 
  echo "    IOSS number: ?"
  echo "    SKU1: $sku1"
  echo "    Quantity1: $quantity1"
  echo "    Seller Code: $seller"
  echo "    Cargo Firm: "
  echo "    $/₺: "
  #echo "    Phone Number:
  
done

