crumb :root do
  link "トップページ", root_path
end

crumb :search do |search|
  link "#{search.name}", "/#{search.search}"
end

crumb :search_word do |search_word|
  if search_word.length == 0
    link "'  ' の検索結果", search_path
  else
    link "'#{search_word}' の検索結果", search_path
  end
end

crumb :activity do |activity|
  link "#{activity.name}", experience_path(activity.id)
  parent :search, activity.genre.category
end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
