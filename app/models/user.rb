class User < ApplicationRecord
  validates :name, :phone, :dob, presence: true
end
