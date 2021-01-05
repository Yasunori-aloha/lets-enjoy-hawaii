# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Area, type: :model do
  let(:area) { build(:area) }

  before do
    sleep(0.1)
  end

  describe '地域登録' do
    context '地域登録ができる場合' do
      it '地域名・島名が入力されていると登録できる' do
        expect(area).to be_valid
      end
    end

    context '地域登録ができない場合' do
      it '地域名が入力されていないと登録できない' do
        area.name = nil
        area.valid?
        expect(area.errors.full_messages).to include '地域名を入力してください'
      end

      it '島名が選択されていないと登録できない' do
        area.island_id = nil
        area.valid?
        expect(area.errors.full_messages).to include '島名を入力してください'
      end
    end
  end
end
