require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本の登録' do
    context '登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@book).to be_valid
      end
      it 'book_memoは空でも保存できること' do
        @book.book_memo = ''
        expect(@book).to be_valid
      end
      it '画像は空でも保存できること' do
        @book.image = nil
        expect(@book).to be_valid
      end
    end
    context '登録ができないとき' do
      it 'user情報がない場合は登録できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('Userを入力してください')
      end
      it 'room情報がない場合は登録できない' do
        @book.room = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('Roomを入力してください')
      end
      it '漫画名が空では登録できない' do
        @book.book_name = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('漫画名を入力してください')
      end
      it '所持巻数が空では登録できない' do
        @book.book_number = ''
        @book.valid?
        expect(@book.errors.full_messages).to include('所持巻数を入力してください')
      end
      it '所得巻数が全角文字を含んでいては登録できない' do
        @book.book_number = '５０'
        @book.valid?
        expect(@book.errors.full_messages).to include('所持巻数は半角数字で入力してください')
      end
    end
  end
end
