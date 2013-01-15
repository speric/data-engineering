class Voucher < ActiveRecord::Base
  validates :description, :price, :presence => true
  
  attr_accessible :description, :price
end
