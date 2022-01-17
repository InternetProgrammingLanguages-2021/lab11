class Cache < ApplicationRecord
  validates :input, uniqueness: true
end
