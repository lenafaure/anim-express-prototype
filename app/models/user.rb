class User < ActiveRecord::Base
  has_one :animator
  before_save { self.email = email.downcase }
  validates :username,
            uniqueness: { case_sensitive: false },
            presence: true,
            length: { minimum: 3, maximu: 25 }
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 105 },
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }
end