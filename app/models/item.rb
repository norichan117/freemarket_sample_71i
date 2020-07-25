class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :trading, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :favorites, dependent: :destroy
  
  validates :category, presence: true
  validates :condition, presence: true
  validates :postage_burden, presence: true
  validates :shipping_area, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true
end
