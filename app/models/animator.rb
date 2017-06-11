class Animator < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true, length: { minimum: 3, maximum: 50}
  validates :last_name, presence: true
  # ensure that every animator has a user linked to it
  validates :user_id, presence: true
end