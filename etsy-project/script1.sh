#!/bin/bash

# orders sayfasının kopyasını kullanarak yeni siparişleri yeni sekmede açar

orders=$(cat INPUTS/Etsy\ -\ Sold\ Orders.html |sed "s/<a/<a\n/g"|grep order_id|cut -d\" -f4|cut -d= -f4|uniq)

google-chrome --new-window
for order in $orders
do
  google-chrome https://www.etsy.com/your/orders/sold/new?order_id=$order
done

