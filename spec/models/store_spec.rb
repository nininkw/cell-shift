require 'rails_helper'

RSpec.describe Store, type: :model do
  has_many: users
  has_many: shift_frames
end
