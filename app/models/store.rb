class Store < ApplicationRecord
  has_many :store_users
  has_many :users, through: :store_users
  has_many :admin_users
  has_many :admins, through: :admin_users
  has_many :shift_frames, dependent: :destroy

  accepts_nested_attributes_for :store_users
  accepts_nested_attributes_for :shift_frames, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: { message: "名前を入力してください" }
  validates :need_workers, inclusion: {in:0..3}
  validate  :open_close_check
  validates_associated :shift_frames 
  validates :shift_name, inclusion: {in:0..3}
  validate  :start_finish_check

  def start_finish_check
    errors.add(:start_at, "勤務開始時間より前の時間を登録できません。") unless
    self.start_at < self.finish_at
  end

  def open_close_check
    errors.add(:close_at, "営業開始時間より前の時間を登録できません。") unless
    self.open_at < self.close_at
  end
end
