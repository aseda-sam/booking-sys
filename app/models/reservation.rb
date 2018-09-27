class Reservation < ApplicationRecord
  belongs_to :room
  
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 }, format: {with: VALID_EMAIL_REGEX }
  
  validates :group, presence: true
  validates :activity, presence: true
end
