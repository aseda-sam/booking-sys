class Reservation < ApplicationRecord
  
  # Without this helper the method I defined - duration won't work
  include ActionView::Helpers::DateHelper
  
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
  validate :time_end_is_after_time_start, :reserve_date_cannot_be_in_the_past
  
  # Work on this. It's giving errors
  # validate :time_start_cannot_be_in_the_past
  
  
  # See https://stackoverflow.com/questions/12181444/ruby-combine-date-and-time-objects-into-a-datetime...
  # ...for possible issues on time zones and daylight savings
  def dt_start
    d = reserve_date
    t = time_start
    dt_start = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
  end
  
  # Improve code to display in minutes when duration is short
  def duration
    dur = distance_of_time_in_words(time_start, time_end)
  end
  
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
    
    #dt_start was used instaed of time_start because dt_start takes into account the date chosen by user
    def time_start_cannot_be_in_the_past
      if time_start.present? && dt_start < Time.now
        errors.add(:time_start, "can't be in the past")
      end
    end


end
