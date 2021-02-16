class Task < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true

  scope :sort_by_endtime, -> { order(end_time: :asc) }
  scope :sort_by_createtime, -> { order(created_at: :desc) }

  def self.search(title = '', status = '')
    if title || status
      Task.where("title LIKE ? AND status LIKE ?", "%#{title}%", "%#{status}%")
    else
      Task.order(created_at: :desc)
    end

  end

end



