class User < ApplicationRecord
  has_secure_password

  has_many :tasks, :dependent => :destroy

  validates :email, presence: true

  enum role: {
    user: 0, 
    admin: 1
  }

  user = User.find_by_email("terry@gmail.com")
  user.update_attribute(:role, 1)
end
