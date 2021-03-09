require 'rails_helper'

RSpec.describe CustomerinfomationPurchaserecord, type: :model do
  describe '商品の購入' do
    before do
      @customer_record = FactoryBot.build(:customerinfomation_purchaserecord)
      sleep 0.1
    end
  
    context "商品購入ができるとき" do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@customer_record).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @customer_record.building_name = ""
        expect(@customer_record).to be_valid
      end
    end
    
    context "商品が購入できないとき" do
      it 'トークンがないと購入できないこと' do
        @customer_record.token = ""
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがないと購入できないこと' do
        @customer_record.user_id = nil
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("User can't be blank") 
      end
      it 'item_idがないと購入できないこと' do
        @customer_record.item_id = nil
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @customer_record.postal_code = "1234590"
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Postal code is invalid")  
      end
      it 'posta_codeが空では購入できないこと' do
        @customer_record.postal_code = ""
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'state_idを選択していないと保存できないこと' do
        @customer_record.state_id = 1
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("State 選択してください")
      end
      it 'cityは空では購入できないこと' do
        @customer_record.city = ""
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineは空では購入できないこと' do
        @customer_record.address_line = ""
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Address line can't be blank") 
      end
      it 'phone_numberが空だと購入できないこと' do
        @customer_record.phone_number = ""
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Phone number can't be blank") 
      end
      it 'phone_numberが-ありだと購入できないこと' do
        @customer_record.phone_number = "090-1234-5678"
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが１２桁以上では購入できないこと' do
        @customer_record.phone_number = "09056784321345"
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'phone_numberが英数字混合では購入できないこと' do
        @customer_record.phone_number = "090anio5890"
        @customer_record.valid?
        expect(@customer_record.errors.full_messages).to include("Phone number is invalid")  
      end
    end
  end
end
