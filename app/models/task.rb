class Task < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true

  scope :sort_by_endtime, -> { order(end_time: :asc) }
  scope :sort_by_createtime, -> { order(created_at: :desc) }

  def self.search(search)

    if search
      find(:all, :conditions => ["#{search} LIKE ?", "%#{search}%"])
    else
      Task.all
    end

  end

end
