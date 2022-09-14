#!/bin/bash
orders=$(cat INPUTS/Etsy\ -\ Sold\ Orders.html |sed "s/<a/<a\n/g"|grep order_id|cut -d\" -f4|cut -d= -f4|uniq)

for order in $orders
do
  google-chrome https://www.etsy.com/your/orders/sold/new?order_id=$order
done

address break-word

Name: cat INPUTS/1.html |sed "s/p>/p>\n/g"|grep country-name|cut -d"<" -f2|cut -d">" -f2

Address 1: cat INPUTS/1.html |sed "s/p>/p>\n/g"|grep country-name|cut -d"<" -f5|cut -d">" -f2

Address 2: 

Zip Code: cat INPUTS/1.html |sed "s/p>/p>\n/g"|grep country-name|cut -d"<" -f12|cut -d">" -f2

Country: cat INPUTS/1.html |sed "s/p>/p>\n/g"|grep country-name|cut -d"<" -f15|cut -d">" -f2

Phone Number:

SKU: cat INPUTS/1.html |sed "s/SKU:/\nSKU:/g"|grep "SKU:"|cut -d"<" -f2|cut -d">" -f2

mail: cat INPUTS/1.html |sed "s/<a/<a\n/g"|grep mailto|cut -d\" -f4|cut -d: -f2|sort|uniq -c|sort|tail -1|cut -d" " -f8

Subtotal: cat INPUTS/1.html |sed "s/<li class/\n<li class/g"|grep "Subtotal"|cut -d$ -f2|cut -d"<" -f1

Shipping price: cat INPUTS/1.html |sed "s/<li class/\n<li class/g"|grep "Shipping price"|cut -d$ -f2|cut -d"<" -f1

TAX: 

IOSS number:


