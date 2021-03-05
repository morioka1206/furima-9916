require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
  end

  describe '商品新規出品' do
    context '出品ができるとき' do
      it '全ての情報が入力できていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明が空だと出品できない' do
        @item.description = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '販売価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が３００円未満だと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は、300円から9,999,999円まで')
      end
      it '販売価格が１０００万円以上だと出品できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は、300円から9,999,999円まで')
      end
      it '販売価格は半角数字以外では出品できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は半角数字のみ')
      end
      it '販売価格は全角文字では出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は半角数字のみ')
      end
      it '販売価格は半角英数字混合では出品できない' do
        @item.price = 'aa3000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は半角数字のみ')
      end
      it 'カテゴリーが空だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category 選択してください')
      end
      it '発送地域が空だと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State 選択してください')
      end
      it '配送料の負担が空だと出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost 選択してください')
      end
      it '発送までの日数が空だと出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day 選択してください')
      end
      it '商品の状態が空だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition 選択してください')
      end
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
