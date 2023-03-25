class Store < ApplicationRecord
  has_many :store_users
  has_many :users, through: :store_users
  has_many :admin_users
  has_many :admins, through: :admin_users
  has_many :shift_frames, dependent: :destroy

  accepts_nested_attributes_for :store_users
  accepts_nested_attributes_for :shift_frames, reject_if: :all_blank, allow_destroy: true
end
