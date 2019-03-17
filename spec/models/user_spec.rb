require 'rails_helper'
describe User do
  describe '#create' do

    context 'can save' do
      # nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
      it "is valid with a nickname, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end

      # nicknameが20文字以下では登録できること
      it "is valid with a nickname the has less than 20 characters" do
        user = build(:user, nickname: Faker::String.random(20))
        user.valid?
        expect(user).to be_valid
      end

      # passwordが6文字以上であれば登録できること
      it "is valid with a password that has more than 6 characters" do
        password = Faker::String.random(6)
        user = build(:user, password: password, password_confirmation: password)
        expect(user).to be_valid
      end
    end


    context 'can not save' do
      # nicknameが空では登録できないこと
      it "is invalid without a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      # emailが空では登録できないこと
      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      # passwordが空では登録できないこと
      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      # passwordが存在してもpassword_confirmationが空では登録できないこと
      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password: Faker::String.random(6), password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end

      # nicknameが21文字以上であれば登録できないこと
      it "is invalid with a nickname that has more than 21 characters" do
        user = build(:user, nickname: Faker::String.random(21))
        user.valid?
        expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
      end

      # 重複したemailが存在する場合登録できないこと
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      # passwordが5文字以下であれば登録できないこと
      it "is invalid with a password that has less than 6 characters" do
        password = Faker::String.random(5)
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
      end

      # passwordが129文字以上であれば登録できないこと
      it "is invalid with a password that more than 128 characters" do
        password = Faker::String.random(129)
        user = build(:user, password: password, password_confirmation: password )
        user.valid?
        expect(user.errors[:password][0]).to include("は128文字以内で入力してください")
      end
    end
  end
end
