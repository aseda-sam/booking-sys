class Reservation < ApplicationRecord
  belongs_to :room
  
  # Email Validations
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 }, format: {with: VALID_EMAIL_REGEX }
  
  # Other Validations
  validates :group, presence: true
  validates :activity, presence: true
  
  # Validates Date and Time
  validates_presence_of :time_start, :time_end
  validate :time_start_cannot_be_in_the_past, :time_end_is_after_time_start, :reserve_date_cannot_be_in_the_past
  
  #Custom Validations
  private
    def time_end_is_after_time_start
      return if time_end.blank? || time_start.blank?
    
      if time_end < time_start
        errors.add(:time_end, "cannot be before the start time") 
      end
    end
    
    def reserve_date_cannot_be_in_the_past
      if reserve_date.present? && reserve_date < Date.today
        errors.add(:reserve_date, "can't be in the past")
      end
    end
    
    def time_start_cannot_be_in_the_past
      if time_start.present? && time_start < Time.now
        errors.add(:time_start, "can't be in the past")
      end
    end

end
