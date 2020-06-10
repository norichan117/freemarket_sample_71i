class Category < ApplicationRecord
  has_many :items
  has_many :images
  belongs_to :category
  belongs_to :brand
end
