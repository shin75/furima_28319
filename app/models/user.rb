class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
ZENKAKU = /\A[ぁ-んァ-ン一-龥]/
KANA = /\A[ァ-ヶー－]+\z/
HANKAKU = /\A[a-zA-Z0-9]+\z/
        
  with_options presence:true do
    validates :name
    validates :first_name, format: {with: ZENKAKU, message:'first_nameを入力してください'}
    validates :last_name, format: {with: ZENKAKU, message: 'last_nameを入力してください'}
    validates :first_name_kana, format: {with: KANA,message: 'はカタカナで入力してください'} 
    validates :last_name_kana, format: {with: KANA,message: 'はカタカナで入力してください'} 
  end

  validates :password, format: { with: HANKAKU}
  validates :birth_day, presence: {message: 'を入力してください'}
  validates :email, presence: {message: 'email must have @'}
end
