class User < ApplicationRecord
  has_secure_password

  belongs_to :city
  has_many :gossips
  has_many :comments
end
