# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Histories', type: :system do
  let(:user) { create(:user) }
  let(:experience) { create(:experience) }
  let(:history) do
    build(:history, user_id: user.id, experience_id: experience.id)
  end

  before do
    sleep(0.1)
  end

  describe '行ったボタンクリック時の動作' do
    context '行った記録がクリックした際にDBに保存される場合' do
      it 'ログインユーザーで、初めてクリックする場合はDBに保存される。' do
        # ログインする。
        sign_in(user)

        # アクティビティ詳細ページへ移動して、行ったボタンがあり、アイコンが足跡か確認する。
        visit experience_path(experience.id)
        expect(page).to have_selector('.fa-shoe-prints')
        expect(page).to have_content('行った')

        # 行ったボタンをクリックするとHistoryモデルのレコード数が1上がり、足跡アイコンがチェックマークに変化する。
        expect {
          find('.have_been_btn').click
          wait_for_selector('.fa-check')
        }.to change(History, :count).by(1)
      end
    end

    context '行った記録がクリックした際にDBから消去される場合' do
      it 'ログインユーザーですでに記録が保存されているアクティビティではクリックするとDBから記録が消去される。' do
        # ログインする。
        sign_in(user)

        # アクティビティ詳細ページへ移動して、行ったボタンがあり、アイコンがチェックマークか確認する。
        history.save
        visit experience_path(experience.id)
        expect(page).to have_selector('.fa-check')
        expect(page).to have_content('行った')

        # 行ったボタンをクリックするとHistoryモデルのレコード数が1下がり、チェックマークが足跡アイコンに変化する。
        expect {
          find('.have_been_btn').click
          wait_for_selector('.fa-shoe-prints')
        }.to change(History, :count).by(-1)
      end
    end

    context 'DBに記録が保存も消去もできない場合' do
      it '未ログインユーザーは行ったボタンが表示されない。' do
        visit experience_path(experience.id)
        expect(page).to have_no_content('行った')
      end
    end
  end
end
