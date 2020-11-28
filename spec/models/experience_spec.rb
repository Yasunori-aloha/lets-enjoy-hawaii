# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Experience, type: :model do
  let(:experience) { build(:experience) }

  describe 'アクティビティ登録' do
    context 'アクティビティが登録できる場合' do
      it '必要な値が全て入力されている' do
        expect(experience).to be_valid
        # binding.pry
      end
      it 'outlineが入力されていなくても登録できる' do
        experience.outline = nil
        expect(experience).to be_valid
      end
      it 'business_hours_startが入力されていなくても登録できる' do
        experience.business_hours_start = nil
        expect(experience).to be_valid
      end
      it 'business_hours_finishが入力されていなくても登録できる' do
        experience.business_hours_finish = nil
        expect(experience).to be_valid
      end
      it 'scoreが入力されていなくても登録できる' do
        experience.score = nil
        expect(experience).to be_valid
      end
      it '画像が添付されていなくても登録できる' do
        experience.image = nil
        expect(experience).to be_valid
      end
    end
    context 'アクティビティが登録できない場合' do
      it 'nameが入力されていない' do
      end
      it 'addressが入力されていない' do
      end
      it 'latitudeが入力されていない' do
      end
      it 'longitudeが入力されていない' do
      end
      it 'area_idが入力されていない' do
      end
      it 'genre_idが入力されていない' do
      end
    end
  end
end
