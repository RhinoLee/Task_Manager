class Task < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true

  scope :filter_by_title, -> (title) { where "title LIKE ? ", "%#{title}%" }
  scope :filter_by_status, -> (status) { where status: status }
  
end
