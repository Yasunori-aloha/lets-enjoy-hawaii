crumb :root do
  link "トップページ", root_path
end

crumb :activity do |activity|
  link "#{activity.name}", "/#{params[:name]}"
end

crumb :search do |search_word|
  if search_word.length == 0
    link "'  ' の検索結果", search_path
  else
    link "'#{search_word}' の検索結果", search_path
  end
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
