crumb :top_page do
  link "トップページ", root_path
end

crumb :search do |search|
  link "#{search.name}", "/#{search.search}"
  parent :top_page
end

crumb :search_word do |search_word|
  if search_word.length == 0
    link "'  ' の検索結果", search_path
  else
    link "'#{search_word}' の検索結果", search_path
  end
  parent :top_page
end

crumb :activity do |activity|
  link "#{activity.name}", experience_path(activity.id)
  parent :search, activity.genre.category
end

crumb :mypage_top do |user_id|
  link 'マイページトップ', user_path(user_id)
end

crumb :mypage_edit do |user_id|
  link '会員情報の確認・変更', edit_user_registration_path
  parent :mypage_top, user_id
end

crumb :mypage_favorites do |user_id|
  link 'お気に入りした場所', user_favorites_path(user_id)
  parent :mypage_top, user_id
end

crumb :mypage_reviews do |user_id|
  link '今までの口コミ', reviews_user_path(user_id)
  parent :mypage_top, user_id
end

crumb :mypage_histories do |user_id|
  link '行った場所', user_histories_path(user_id)
  parent :mypage_top, user_id
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
