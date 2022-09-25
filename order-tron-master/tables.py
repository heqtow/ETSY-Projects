from table_maker import TableMaker
from utils import tsz_to_date, tsz_to_meta_str, MetaStr
from datetime import datetime, timezone

@TableMaker.create([
  #("Order Number", "orderNumber"),
  ("Kargo tarihi", "creationTimestamp"),
  #Kargo no
  ("ALICI / MÜŞTERİ ADI", "buyerName"),
  ("Ülke", "countryId"),
  #İhracat Tipi
  #Kargo firması
  #Bayi Satıcı Kodu
  #Fatura No
  ("FATURA BEDELİ", "amountPaid"),
  #Para Birimi
  #Kur
  #Ürün
  #phone
  ("Address 1", "address1"),
  ("Address 2", "address2"),
  ("Şehir", "city"),
  ("Eyalet", "state"),
  ("Posta kodu", "zip"),
  ("Email", "buyerEmail")
  #IOSS
  #Boyut
])
def order_overview(add_row, session, page):
  receipts = session.receipts(page)

  for receipt in receipts:
    ship_date = None
    delivered = False
    days_in_transit = None
    if len(receipt["shipments"]) > 0:
      shipment = receipt["shipments"][0]
      ship_date = tsz_to_meta_str(shipment["mailing_date"])
      delivered = shipment["current_step"] == "delivered"

      if shipment["current_step"] == "in_transit":
        mail_date = tsz_to_date(shipment["mailing_date"])
        now = datetime.now(timezone.utc)
        days_in_transit = int((now - mail_date).total_seconds() / (24 * 60 * 60))

    add_row(
#      MetaStr(
#        (f"<a href='https://www.etsy.com/your/orders/{receipt['receipt_id']}?order_id={receipt['receipt_id']}' target='_blank'>"
#        f"{receipt['receipt_id']}</a>"),
#        receipt['receipt_id']
#      ),
      tsz_to_meta_str(receipt["creation_tsz"]),
      #Kargo no
      receipt["name"],
      receipt["country_id"],
      #İhracat Tipi
      #Kargo firması
      #Bayi Satıcı Kodu
      #Fatura No
      MetaStr(f"{receipt['subtotal']}", float(receipt['subtotal'])),
      #Para Birimi
      #Kur
      #Ürün
      #phone
      receipt["first_line"],
      receipt["second_line"],
      receipt["city"],
      receipt["state"],
      receipt["zip"],
      receipt["buyer_email"]
      #IOSS
      #Boyut
    )
