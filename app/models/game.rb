class Game < ApplicationRecord
  has_many :listings, as: :listable, dependent: :destroy

  def to_param
    bgg_id
  end

  def self.find(id)
    find_by(bgg_id: id)
  end
end
