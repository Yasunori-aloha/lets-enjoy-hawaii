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

      it '説明文が入力されていなくても登録できる' do
        experience.outline = nil
        expect(experience).to be_valid
      end

      it '営業開始時間が入力されていなくても登録できる' do
        experience.business_hours_start = nil
        expect(experience).to be_valid
      end

      it '営業終了時間が入力されていなくても登録できる' do
        experience.business_hours_finish = nil
        expect(experience).to be_valid
      end

      it '評価点が入力されていなくても登録できる' do
        experience.score = nil
        expect(experience).to be_valid
      end

      it '北を0度とした際の方向が入力されていなくても登録できる' do
        experience.heading = nil
        expect(experience).to be_valid
      end

      it 'カメラの垂直方向の向きが入力されていなくても登録できる' do
        experience.pitch = nil
        expect(experience).to be_valid
      end

      it '水平方向の視野角が入力されていなくても登録できる' do
        experience.fov = nil
        expect(experience).to be_valid
      end

      it '拡大率が入力されていなくても登録できる' do
        experience.zoom = nil
        expect(experience).to be_valid
      end

      it '画像が添付されていなくても登録できる' do
        experience.image = nil
        expect(experience).to be_valid
      end
    end

    context 'アクティビティが登録できない場合' do
      it 'アクティビティ名が入力されていない' do
        experience.name = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Nameを入力してください'
      end

      it '住所が入力されていない' do
        experience.address = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Addressを入力してください'
      end

      it '緯度が入力されていない' do
        experience.latitude = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Latitudeを入力してください'
      end

      it '経度が入力されていない' do
        experience.longitude = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Longitudeを入力してください'
      end

      it '地域が入力されていない' do
        experience.area_id = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Areaを入力してください'
      end

      it 'ジャンルが入力されていない' do
        experience.genre_id = nil
        experience.valid?
        expect(experience.errors.full_messages).to include 'Genreを入力してください'
      end
    end
  end
end
