class AdminUser < ApplicationRecord
  belongs_to :admin
  belongs_to :store
end
