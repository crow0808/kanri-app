require 'rails_helper'

RSpec.describe Manual, type: :model do
  before do
    @manual = FactoryBot.build(:manual)
  end

  describe '取扱説明書の登録' do
    context '登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@manual).to be_valid
      end
      it 'model_numberは空でも保存できること' do
        @manual.model_number = ''
        expect(@manual).to be_valid
      end
      it 'manual_urlは空でも保存できること' do
        @manual.manual_url = ''
        expect(@manual).to be_valid
      end
      it 'assuranceは空でも保存できること' do
        @manual.assurance = ''
        expect(@manual).to be_valid
      end
      it 'manual_dateは空でも保存できること' do
        @manual.manual_date = ''
        expect(@manual).to be_valid
      end
      it 'priceは空でも保存できること' do
        @manual.price = ''
        expect(@manual).to be_valid
      end
      it 'manual_memoは空でも保存できること' do
        @manual.manual_memo = ''
        expect(@manual).to be_valid
      end
      it '画像は空でも保存できること' do
        @manual.image = nil
        expect(@manual).to be_valid
      end
    end
    context '登録ができないとき' do
      it 'user情報がない場合は登録できない' do
        @manual.user = nil
        @manual.valid?
        expect(@manual.errors.full_messages).to include('Userを入力してください')
      end
      it 'room情報がない場合は登録できない' do
        @manual.room= nil
        @manual.valid?
        expect(@manual.errors.full_messages).to include('Roomを入力してください')
      end
      it '商品名が空では登録できない' do
        @manual.manual_name = ''
        @manual.valid?
        expect(@manual.errors.full_messages).to include('商品名を入力してください')
      end
      it '購入価格が全角文字を含んでいては登録できない' do
        @manual.price = '５００'
        @manual.valid?
        expect(@manual.errors.full_messages).to include('購入価格は半角数字で入力してください')
      end
    end
  end
end
