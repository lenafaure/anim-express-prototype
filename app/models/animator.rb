class Animator < ActiveRecord::Base
  validates :first_name, presence: true, length: { minimum: 3, maximum: 50}
  validates :last_name, presence: true

end