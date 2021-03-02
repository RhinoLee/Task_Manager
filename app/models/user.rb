class User < ApplicationRecord
  has_secure_password

  has_many :tasks, :dependent => :destroy

  validates :email, presence: true, uniqueness: true

  enum role: {
    user: 0, 
    admin: 1
  }

end
