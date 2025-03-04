class User < ApplicationRecord
  has_secure_password

  has_many :lists, dependent: :destroy
  has_many :listings, through: :lists
  has_many :sessions, class_name: "Users::Session", dependent: :destroy

  validates_uniqueness_of :email_address
end
