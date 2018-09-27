class Reservation < ApplicationRecord
  belongs_to :room
  
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 105 }, format: {with: VALID_EMAIL_REGEX }
  
  validates :group, presence: true
  validates :activity, presence: true
  
  #validates :reserve_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }, on: :create
  # validates :start_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }, on: :create
  # validates :reserve_date, presence: true
  
  validates_presence_of :time_start, :time_end
  validate :time_end_is_after_time_start
  
  
  private
    def time_end_is_after_time_start
      return if time_end.blank? || time_start.blank?
    
      if time_end < time_start
        errors.add(:time_end, "cannot be before the start time") 
      end 
    end

end
