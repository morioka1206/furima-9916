class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname, presence: true
    validates :birthday, presence: true

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "全角（漢字・ひらがな・カタカナ）での入力が必須" } do
    validates :family_name
    validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）での入力が必須" } do
    validates :family_name_kana
    validates :first_name_kana
    end

    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
    
  end
end
