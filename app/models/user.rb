class User < ApplicationRecord
  validates :name, :phone, :dob, presence: true
  validates :name, :phone, uniqueness: { case_sensitive: true }
end
