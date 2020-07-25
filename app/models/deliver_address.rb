class DeliverAddress < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true, presence: true
  validates :deliver_family_name, presence: true
  validates :deliver_first_name, presence: true
  validates :deliver_family_name_kana, presence: true
  validates :deliver_first_name_kana, presence: true
  validates :deliver_yubin_bango, presence: true
  validates :deliver_todofuken, presence: true
  validates :deliver_shichoson, presence: true
  validates :deliver_banchi, presence: true

end
