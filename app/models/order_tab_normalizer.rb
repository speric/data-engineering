class OrderTabNormalizer
  
  CUSTOMER_NAME    = 0
  ITEM_DESCRIPTION = 1
  ITEM_PRICE       = 2
  PURCHASE_COUNT   = 3
  MERCHANT_ADDRESS = 4
  MERCHANT_NAME    = 5
  
  def self.normalize(row)
    {
     customer_id:   Customer.find_or_create_by_full_name(row[CUSTOMER_NAME]).id,
     voucher_id:    Voucher.find_or_create_by_description_and_price(row[ITEM_DESCRIPTION], row[ITEM_PRICE].to_f).id,
     merchant_id:   Merchant.find_or_create_by_full_name_and_address(row[MERCHANT_NAME], row[MERCHANT_ADDRESS]).id,
     voucher_count: row[PURCHASE_COUNT].to_i
    }
  end
end