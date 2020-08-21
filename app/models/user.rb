class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
  with_options presence:true do
    validates :name
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ , message:'first_nameを入力してください'}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'last_nameを入力してください'}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: 'はカタカナで入力してください'} 
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: 'はカタカナで入力してください'} 
  end

  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}
  validates :birth_day, presence: {message: 'を入力してください'}
end
