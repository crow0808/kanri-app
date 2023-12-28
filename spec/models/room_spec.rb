require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it 'room_nameとroom_passwordの値が存在すれば作成できる' do
        expect(@room).to be_valid
      end
    end
    context '新規作成できない場合' do
      it 'room_nameが空では作成できない' do
        @room.room_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include('ルーム名を入力してください')
      end
      it 'room_passwordが空では作成できない' do
        @room.room_password = ''
        @room.valid?
        expect(@room.errors.full_messages).to include('パスコードを入力してください')
      end
      it 'room_passwordが4桁未満では作成できない' do
        @room.room_password = '123'
        @room.valid?
        expect(@room.errors.full_messages).to include('パスコードは4文字の半角数字で入力してください')
      end
      it 'room_passwordが5桁以上では作成できない' do
        @room.room_password = '12345'
        @room.valid?
        expect(@room.errors.full_messages).to include('パスコードは4文字の半角数字で入力してください')
      end
      it 'room_passwordが全角数字では作成できない' do
        @room.room_password = '１２３４'
        @room.valid?
        expect(@room.errors.full_messages).to include('パスコードは4文字の半角数字で入力してください')
      end
      it 'room_passwordが半角数字以外では作成できない' do
        @room.room_password = '12ab'
        @room.valid?
        expect(@room.errors.full_messages).to include('パスコードは4文字の半角数字で入力してください')
      end
      it 'room_nameとroom_passwordの組み合わせがすでに存在する場合は作成できない' do
        FactoryBot.create(:room, room_name: 'TestRoom', room_password: '1234')
        @room.room_name = 'TestRoom'
        @room.room_password = '1234'
        @room.valid?
        expect(@room.errors.full_messages).to include('ルーム名とこのパスコードの組み合わせはすでに存在します')
      end
    end
  end
end
