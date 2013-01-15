class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :voucher
  belongs_to :merchant
  
  validates :customer_id, :voucher_id, :merchant_id, :presence => true
  validates :voucher_count, :numericality => { :only_integer => true, :greater_than => 0 }

  attr_accessible :customer_id, :voucher_id, :merchant_id, :voucher_count
  
  def total_revenue
    self.voucher.price.to_f * self.voucher_count.to_f
  end
end