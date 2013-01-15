class Merchant < ActiveRecord::Base
  validates :full_name, :address, :presence => true
  
  attr_accessible :full_name, :address
end
