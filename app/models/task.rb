class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true

  scope :sort_by_endtime, -> { order(end_time: :asc) }
  scope :sort_by_createtime, -> { order(created_at: :desc) }
  scope :sort_by_level_desc, -> { order(level: :desc) }
  scope :sort_by_level_asc, -> { order(level: :asc) }

  def self.search(title = '', status = '')
    if title != '' || status != ''
      Task.where("title ILIKE ? AND status LIKE ?", "%#{title}%", "%#{status}%")
    else
      Task.sort_by_createtime
    end

  end

end



