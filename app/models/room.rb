class Room < ApplicationRecord
  has_many :reservations
  validates :name, uniqueness: { case_sensitive: false }
end
