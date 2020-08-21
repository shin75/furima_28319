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