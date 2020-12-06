# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Experience, type: :model do
  let(:experience) { create(:experience) }
  # 処理が早すぎて先に読み込まれるべきデータが読み込まれないため、１秒の間隔をあける。

  before do
    sleep(0.1)
  end

  describe 'アクティビティ登録' do
    context 'アクティビティが登録できる場合' do
      it '必要な値が全て入力されている' do
        expect(experience).to be_valid
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
        experience.name = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Nameを入力してください'
      end

      it 'addressが入力されていない' do
        experience.address = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Addressを入力してください'
      end

      it 'latitudeが入力されていない' do
        experience.latitude = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Latitudeを入力してください'
      end

      it 'longitudeが入力されていない' do
        experience.longitude = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Longitudeを入力してください'
      end

      it 'area_idが入力されていない' do
        experience.area_id = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Areaを入力してください'
      end

      it 'genre_idが入力されていない' do
        experience.genre_id = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Genreを入力してください'
      end
    end
  end
end
