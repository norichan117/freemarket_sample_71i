
require 'rails_helper'
describe DeliverAddress do
  describe '#create' do
    # 1
    it "is valid with a deliver_family_name and a deliver_first_name and a deliver_family_name_kana and a deliver_first_name_kana and a deliver_yubin_bango and a deliver_todofuken and a deliver_shichoson and a deliver_banchi" do
      deliver_address = build(:deliver_address, deliver_building: nil, deliver_tel_no: nil)
      expect(user).to be_valid
    end

    # 2
    it "is invalid without a deliver_family_name" do
      deliver_address = build(:deliver_address, deliver_family_name: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_family_name]).to include("can't be blank")
    end
    
    # 3
    it "is invalid without a deliver_first_name" do
      deliver_address = build(:deliver_address, deliver_first_name: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_first_name]).to include("can't be blank")
    end

    # 4
    it "is invalid without a deliver_family_name_kana" do
      deliver_address = build(:deliver_address, deliver_family_name_kana: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_family_name_kana]).to include("can't be blank")
    end
    # 5
    it "is invalid without a deliver_first_name_kana" do
      deliver_address = build(:deliver_address, deliver_first_name_kana: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_first_name_kana]).to include("can't be blank")
    end
    
    # 6
    it "is invalid without a deliver_yubin_bango" do
      deliver_address = build(:deliver_address, deliver_yubin_bango: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_yubin_bango]).to include("can't be blank")
    end

    # 7
    it "is invalid without a deliver_todofuken" do
      deliver_address = build(:deliver_address, deliver_todofuken: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_todofuken]).to include("can't be blank")
    end

    # 8
    it "is invalid without a deliver_shichoson" do
      deliver_address = build(:deliver_address, deliver_shichoson: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_shichoson]).to include("can't be blank")
    end    
    
    # 9
    it "is invalid without a deliver_banchi" do
      deliver_address = build(:deliver_address, deliver_banchi: nil)
      deliver_address.valid?
      expect(user.errors[:deliver_banchi]).to include("can't be blank")
    end       
  end
end
