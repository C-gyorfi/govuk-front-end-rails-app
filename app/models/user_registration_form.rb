class UserRegistrationForm
  include ActiveModel::Model
  attr_accessor :name, :phone, :dob

  validates :name, :phone, :dob, presence: true

  def initialize(args = {})
    @name = args[:name]
    @phone = args[:phone]
    @dob = args[:dob]
  end

  def save
    return false unless valid?

    User.new(name: @name, phone: @phone, dob: @dob).save
  end
end
