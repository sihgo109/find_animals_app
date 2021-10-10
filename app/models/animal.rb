class Animal < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :name, presence: true
  validates :image, presence: true
  validates :genre, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :age, presence: true
  validates :prefecture, presence: true
  validates :charm_point, presence: true
end
