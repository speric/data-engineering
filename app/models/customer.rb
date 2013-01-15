class Customer < ActiveRecord::Base
  validates :full_name, :presence => true
  
  attr_accessible :full_name
end
