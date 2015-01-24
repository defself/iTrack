class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: /@/

  belongs_to :role
end
