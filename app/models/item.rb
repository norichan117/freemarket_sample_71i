class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :trading, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :favorites

end
