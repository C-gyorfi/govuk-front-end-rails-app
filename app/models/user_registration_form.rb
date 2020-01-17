class UserRegistrationForm
  include ActiveModel::Model
  attr_accessor :name, :phone, :dob

  validates :name, :phone, :dob, presence: true
  validate :name_is_unique
  validate :phone_is_unique
  validate :dob_is_a_date

  def initialize(args = {})
    @name = args[:name]
    @phone = args[:phone]
    @dob = args[:dob]
  end

  def save
    return false unless valid?

    User.new(name: @name, phone: @phone, dob: @dob).save
  end

  def name_is_unique
    return true if name.nil?
    errors.add(:name, 'Name has already taken') if User.where("LOWER(name) = ?", name.downcase).any?
  end

  def phone_is_unique
    return true if name.nil?
    errors.add(:phone, 'Phone has already taken') unless User.find_by(phone: phone).nil?
  end

  def dob_is_a_date
    begin 
      Date.parse(dob)
    rescue
      errors.add(:dob, 'You date of birth must be a valid date')
    end
  end
end
