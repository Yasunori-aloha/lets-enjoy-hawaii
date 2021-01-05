# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  let(:user) { create(:user) }
  let(:experience) { create(:experience) }
  let(:history) { build(:history, user_id: user.id, experience_id: experience.id) }

  before do
    sleep(0.1)
  end

  describe '行ったボタンクリック履歴保存' do
    context '行った履歴がDBに保存される。' do
      it 'ユーザーが初めて行ったボタンをクリックしたアクティビティなら保存される。' do
        expect(history).to be_valid
      end
    end

    context '行った履歴がDBに保存されない。' do
      it 'すでにアクティビティをクリックしていれば保存されない。' do
        history.save
        another_history = build(:history, user_id: user.id, experience_id: experience.id)
        another_history.valid?
        expect(another_history.errors.full_messages).to include 'ユーザーはすでに存在します'
      end
      it '未ログインユーザーによる訪問記録登録' do
      end
      end
      it '存在しないアクティビティに対しての訪問記録登録' do
      end
      end
    end
  end
end
