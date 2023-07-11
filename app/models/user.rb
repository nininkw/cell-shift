class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :store_users
  has_many :stores, through: :store_users
  has_many :shift_posts

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
