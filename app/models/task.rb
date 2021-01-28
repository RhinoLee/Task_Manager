class Task < ApplicationRecord

  validates :title, presence: { message: "任務名稱不得空白" }
  validates :content, presence: { message: "任務內容不得空白" }

end
