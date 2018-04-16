class Image < ApplicationRecord
  has_many :gifts

  validates_uniqueness_of :nps_id
end
