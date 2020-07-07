json.array! @category_children do |child|
  json.id child.id
  json.category_name child.category_name
end

json.array! @category_grandchildren do |grandchild|
  json.id grandchild.id
  json.category_name grandchild.category_name
end