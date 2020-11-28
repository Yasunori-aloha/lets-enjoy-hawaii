# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  let(:history) { build(:history) }
  let(:another_history) { build(:history) }

  describe '行ったボタンクリック履歴保存' do
    context '行った履歴がDBに保存される。' do
      it 'ユーザーが初めて行ったボタンをクリックしたアクティビティなら保存される。' do
        expect(history).to be_valid
      end
    end
    context '行った履歴がDBに保存されない。' do
      it 'すでにアクティビティをクリックしていれば保存されない。' do
        history.save
        another_history.user_id = history.user_id
        another_history.experience_id = history.experience_id
        another_history.valid?
        expect(another_history.errors.full_messages).to include 'Userはすでに存在します'
      end
    end
  end
end
