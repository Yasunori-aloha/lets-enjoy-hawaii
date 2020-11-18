require 'rails_helper'

RSpec.describe 'Reviews', type: :system do
  before do
    @user = create(:user)
    @experience = create(:experience)
    @review = build(:review)
  end

  context '口コミの新規投稿ができる場合' do
    it 'ログインしているユーザーで、正常な値を入力していれば新規投稿ができる' do
      # ログインする。
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_on 'ログイン'
      expect(current_path).to eq root_path

      # アクティビティ詳細ページへ移動して、口コミ投稿ボタンがあるか確認する。
      visit experience_path(@experience.id)
      expect(page).to have_content('口コミ投稿')

      # 口コミ投稿ページへ移動してフォームに情報を入力する。
      visit new_experience_review_path(@experience.id)
      find_by_id("star_btn#{rand(1..5)}").click
      fill_in 'review_title', with: @review.title
      fill_in 'review_comment', with: @review.comment
      find('input[name="review[images][]"]', visible: false).set("#{Rails.root}/spec/fixtures/files/test_image.png")

      # フォームを送信すると、Reviewモデルのレコード数が1上がり、アクティビティの評価点が更新されて詳細ページへリダイレクトされる。
      expect { click_on('投稿する') }.to change { Review.count }.by(1)
      expect(@experience.reload.score).to eq @experience.reviews.average(:score).round(1)
      expect(current_path).to eq experience_path(@experience.id)

      # 詳細ページの口コミ件数が1件増えているか確認する。
      reviews = all(:css, '[data-name="review_count"]')
      reviews.each do |review|
        expect(review).to have_content(@experience.reviews.length.to_s)
      end

      # 詳細ページの評価点・★の5段階評価が、更新された評価点に対応した表示になっているか確認する。
      expect(page).to have_selector('.rating_point', text: @experience.score.to_s)
      expect(page).to have_css("#star_rating0[style='width: #{(@experience.score * 20).floor}%;']")

      # 評価分布のグラフと％表示が、投稿された口コミに対応した表示になっているか確認する。
      scores = @experience.reviews.group(:score).count
      scores.each do |key, value|
        percent = (value.to_f / @experience.reviews.length * 100).floor
        expect(page).to have_selector("#score_#{key}", text: percent.to_s)
        expect(page).to have_css("#graph_score#{key}[style='width: #{percent}%;']")
      end
    end
  end
  context '口コミの新規投稿ができない場合' do
    it '未ログインユーザーは口コミ投稿ページへ遷移するボタンが表示されない' do
      visit experience_path(@experience.id)
      expect(page).to have_no_content('口コミ投稿')
    end
    it '未ログインユーザーは直接口コミ投稿ページへのリンクを打ち込んでもログイン画面へ遷移する' do
      visit new_experience_review_path(@experience.id)
      binding.pry
    end
  end
end
