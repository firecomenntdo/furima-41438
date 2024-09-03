class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字を含めてください' }
  validates :password_confirmation, presence: true
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :birth, presence: true
end
