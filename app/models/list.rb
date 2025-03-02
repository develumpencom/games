class List < ApplicationRecord
  belongs_to :user
  has_many :listings

  validates_presence_of :name
end
