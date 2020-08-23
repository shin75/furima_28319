require 'rails_helper'

#RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
#end

require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it "すべて入力すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "0000000"
      @user.password_confirmation = "0000000"
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまく行かないとき'
    it "ニックネームが必須であること" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスは@を含む必要があること" do
      @user.email = "aaagmail.com"
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは確認用含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが6文字以上であること" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
     it "first_nameが空では登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors[:first_name]).to include("first_nameを入力してください")
    end
      it "last_nameが空では登録できないこと" do
       @user.last_name = ""
       @user.valid?
       expect(@user.errors[:last_name]).to include("last_nameを入力してください")
      end
      it 'first_name_kanaがカタカナでないと登録できないこと' do
       @user.first_name_kana = "kana"
       @user.valid?
       expect(@user.errors[:first_name_kana]).to include("はカタカナで入力してください")
      end
      it 'last_name_kanaがカタカナでないと登録できないこと' do
      @user.last_name_kana = "kana"
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("はカタカナで入力してください")
    end
    it "birth_dayが空では登録できないこと" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors[:birth_day]).to include("を入力してください")
    end
end
end
end