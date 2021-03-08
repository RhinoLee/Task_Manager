class User < ApplicationRecord
  has_secure_password

  has_many :tasks, :dependent => :destroy

  validates :email, presence: true, uniqueness: true

  enum role: {
    user: 0, 
    admin: 1,
    master: 2
  }

  u1 = User.find_by(email: 'terry@gmail.com')
  u2 = User.find_by(email: 'seed@gmail.com')
  u1.update_attribute(:role, 2) if u1 != nil
  u2.update_attribute(:role, 2) if u2 != nil

end
