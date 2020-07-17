crumb :root do
  link "トップページ", root_path
end

crumb :child_category do
  link "#{Category.find(params[:id]).category_name}", category_path
  parent :root
end

crumb :grandchild_category do
  link "#{Category.find(params[:id]).category_name}"
  parent :child_category
end


# crumb :root do
#   link "トップページ", root_path
# end

# crumb :category_index do
#   link "カテゴリー一覧", categorys_path
# end

# # 親カテゴリーのパンくず
# crumb :parent_category do |category|
#   category = Category.find(params[:id]).root
#   link "#{category.name}", category_path(category)
#   parent :category_index
# end
# # -----------------------------------------------------------------
# # 子カテゴリーのパンくず
# crumb :child_category do |category|
#   category = Category.find(params[:id])
#   # 表示しているページが子カテゴリーの一覧ページの場合
#   if category.has_children?
#     link "#{category.name}", category_path(category)
#     parent :parent_category

#   # 表示しているページが孫カテゴリーの一覧ページの場合
#   else
#     link "#{category.parent.name}", category_path(category.parent)
#     parent :parent_category
#   end
# end
# # -----------------------------------------------------------------
# # 孫カテゴリーのパンくず
# crumb :grandchild_category do |category|
#   category = Category.find(params[:id])
#   link "#{category.name}", category_path(category)
#   parent :child_category
# end




# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).