class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.login_field      = :email
    config.crypto_provider  = Authlogic::CryptoProviders::Sha512
  end
  
  validates :email, presence: true, uniqueness: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :full_name, presence: true
  
  attr_accessible :email, :password, :password_confirmation, :full_name
end