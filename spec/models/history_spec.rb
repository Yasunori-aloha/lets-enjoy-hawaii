require 'rails_helper'

RSpec.describe History, type: :model do
  let(:user) {create(:user)}
  let(:experience) {create(:experience)}
  
  describe '行ったボタンクリック履歴保存' do
    context '行った履歴がDBに保存される。' do
      it 'そのユーザーの初めてのクリックなら保存される。' do
      end
      it 'ユーザーは同じでも、別のアクティビティなら保存される。' do
      end
      it '同じアクティビティでも、別のユーザーなら保存される。' do
      end
    end
    context '行った履歴がDBに保存されない。' do
      it 'すでにアクティビティをクリックしていれば保存されない。' do
      end
    end
  end

  describe '行ったボタンクリック履歴消去' do
    context '行った履歴がDBから消去される。' do
      it 'すでに履歴がDBに保存されていれば、データを消去できる。' do
      end
    end
    context '行った履歴がDBから消去されない。' do
      it 'クリックしたユーザーの行った履歴がDBに保存されていなければ、データを消去できない。' do
      end
    end
  end
end
