class User < ActiveRecord::Base
  has_secure_password

  has_many :surveys
  has_many :completed_surveys

  validates :username, presence: true, uniqueness: true
end
