class Image < ApplicationRecord
  validates_uniqueness_of :nps_id
end
