class User < ActiveRecord::Base
  has_secure_password
  has_many :smoothies
  validates :name, :email, presence: true
end

