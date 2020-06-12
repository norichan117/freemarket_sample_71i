require 'rails_helper'
describe User do
  describe '#create' do
    # 1
    it "is valid with a nickname and an email and a password and a password_confirmation and a family_name and first_name and a family_name_kana and a first_name_kana and a birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6
    it "is invalid without a family_name" do
      user = create(:user)
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    # 7
    it "is invalid without a first_name" do
      user = create(:user)
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 8
    it "is invalid without a family_name_kana" do
      user = create(:user)
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    # 9
    it "is invalid without a first_name_kana" do
      user = create(:user)
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 10
    it "is invalid without a birthday" do
      user = create(:user)
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 11
    it "is valid with a password of 7 characters" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 12
    it "is invalid with a password of 6 characters"" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end
