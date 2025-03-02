class Listing < ApplicationRecord
  belongs_to :list
  belongs_to :listable, polymorphic: true
end
