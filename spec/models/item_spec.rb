require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの登録' do
    context '登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'item_memoは空でも保存できること' do
        @item.item_memo = ''
        expect(@item).to be_valid
      end
      it '画像は空でも保存できること' do
        @item.image = nil
        expect(@item).to be_valid
      end
    end
    context '登録ができないとき' do
      it 'user情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
      it 'room情報がない場合は登録できない' do
        @item.room = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Roomを入力してください')
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
    end
  end
end
