class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :store_users
  has_many :stores, through: :store_users
  has_many :shift_posts

  validates :name, presence: { message: "名前を入力してください" }
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  validates :email, uniqueness: true, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :shift_stabilize, inclusion: {in:0..3}, presence:  { message: "専門シフトの有無を入力してください" }
  validates :wday, inclusion: {in:["日","月","火","水","木","金","土","特になし"]}
  validates :max_work, inclusion: {in:0..3}
  validates :wages, numericality: {greater_than_or_equal_to: 1_113	}


  def shift_stabilize_text
    case shift_stabilize
    when 0
      "特になし"
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

  def wday_text
    case wday
    when 0
      "日"
    when 1
      "月"
    when 2
      "火"
    when 3
      "水"
    when 4
      "木"
    when 5
      "金"
    when 6
      "土"
    else
      "不明な値"
    end
  end

  def max_work_text
    case max_work
    when 0
      "２日"
    when 1
      "３日"
    when 2
      "４日"
    when 3
      "５日"
    else
      "特になし"
    end
  end
end
