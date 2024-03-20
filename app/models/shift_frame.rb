class ShiftFrame < ApplicationRecord
  belongs_to :store

  validates :shift_name, inclusion: {in:0..3}
  validate  :start_finish_check

  def start_finish_check
    errors.add(:start_at, "勤務開始時間より前の時間を登録できません。") unless
    self.start_at < self.finish_at
  end

  def shift_name_text
    case shift_name
    when 0
      "通し"
    when 1
      "早番"
    when 2
      "中番"
    when 3
      "遅番"
    else
      "不明な値"
    end
  end
end
