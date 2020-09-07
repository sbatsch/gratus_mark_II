class User < ApplicationRecord
  has_secure_password

  has_many :reflections
  has_many :prompts, through: :reflections

  validates :email, presence: true, uniqueness: true
end
