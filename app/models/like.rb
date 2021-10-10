class Like < ApplicationRecord

  validates :user_id, presence: true
  validates :animal_id, presence: true
end
