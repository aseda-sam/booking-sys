class Member < ApplicationRecord
  # Email Validations. See https://stackoverflow.com/questions/6567793/validate-email-format-only-if-not-blank-rails-3 for more ideas
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :allow_blank => true, length: { maximum: 105 }, format: {with: VALID_EMAIL_REGEX }
  # validates :email,:presence => {:message => "Your email is used to save your greeting."}, :allow_blank => true,:uniqueness => { :case_sensitive => false }
end
