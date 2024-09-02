class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/ }, length: { minimum: 6 }
  validates :password_confirmation, presence: true, format: { with: /\A[a-z0-9]+\z/ }, length: { minimum: 6 }
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth, presence: true
end
