class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :job, presence: true
  validates :profile, presence: true
  validates :prefecture, presence: true


  has_many :animals
  has_many :comments
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.nickname = 'ゲストユーザ'
      user.phone_number = '01012345678'
      user.last_name = 'guest'
      user.first_name = 'user'
      user.age = '30'
      user.job = 'job'
      user.prefecture = 'tokyo'
      user.profile = 'guest'
    end
  end

end
