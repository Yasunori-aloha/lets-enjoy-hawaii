require 'rails_helper'

RSpec.describe History, type: :model do
  let(:user) {create(:user)}
  let(:user_2) {create(:user)}
  let(:experience) {create(:experience)}
  let(:experience_2) {create(:experience)}
  let(:history) {build(:history, user_id: user.id, experience_id: experience.id)}
  let(:history_2) {build(:history, user_id: user.id, experience_id: experience.id)}

  describe '行ったボタンクリック履歴保存' do
    context '行った履歴がDBに保存される。' do
      it 'そのユーザーの初めてのクリックなら保存される。' do
        expect(history).to be_valid
      end
      it 'ユーザーは同じでも、別のアクティビティなら保存される。' do
        history.save
        history_2.experience_id = experience_2.id
        expect(history).to be_valid
      end
      it '同じアクティビティでも、別のユーザーなら保存される。' do
        history.save
        history_2.user_id = user_2.id
        expect(history).to be_valid
        # binding.pry
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
