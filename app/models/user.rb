class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true

  validates :email, presence: true

  validates :password, presence: true, length: { minimum: 6 }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :lastname
  validates :firstname
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字を使用してください' } do
  validates :lastname_kana
  validates :firstname_kana
  end

  validates :birthday, presence: true

end
