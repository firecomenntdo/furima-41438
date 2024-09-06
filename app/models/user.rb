class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字を含めてください' }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :lastname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  # validates :birth, presence: true, message: 'を入力してください'
  validates :birth, presence: { message: 'を入力してください' }

  has_many :items
end
