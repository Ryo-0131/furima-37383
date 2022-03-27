require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'name、description、category_id、sales_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'category_idが「---」以外であれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'sales_status_idが「---」以外であれば登録できる' do
        @item.sales_status_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_fee_status_idが「---」以外であれば登録できる' do
        @item.shipping_fee_status_id = 2
        expect(@item).to be_valid
      end
      it 'prefecture_idが「---」以外であれば登録できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it 'scheduled_delivery_idが「---」以外であれば登録できる' do
        @item.scheduled_delivery_id = 2
        expect(@item).to be_valid
      end
      it 'priceが半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      context '商品出品できないとき' do
        it 'imageがないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空では登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'category_idが空では登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'category_idが1だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'sales_status_idが空では登録できない' do
          @item.sales_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status can't be blank")
        end
        it 'sales_status_idが1だと出品できない' do
          @item.sales_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales status can't be blank")
        end
        it 'shipping_fee_status_idが空では登録できない' do
          @item.shipping_fee_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
        end
        it 'shipping_fee_status_idが1だと出品できない' do
          @item.shipping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
        end
        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'prefecture_idが1だと出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'scheduled_delivery_idが空では登録できない' do
          @item.scheduled_delivery_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end
        it 'scheduled_delivery_idが1だと出品できない' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceの範囲が、300円未満だと出品できない' do
          @item.price = 10
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceの範囲が、9,999,999円を超えると出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceに半角数字以外が含まれている場合は出品できない' do
          @item.price = "a"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'ユーザー情報がない場合は登録できない' do
          @item.user_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include()
        end
      end
    end
  end
end
