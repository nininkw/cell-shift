class ShiftPost < ApplicationRecord
  belongs_to :user

  # validates :selected_dates
  
  def start_time
    self.selected_dates.to_datetime
  end
end
