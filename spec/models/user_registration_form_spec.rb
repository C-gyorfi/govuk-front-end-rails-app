require 'rails_helper'

RSpec.describe UserRegistrationForm, type: :model do
  describe 'a valid registration form' do
    subject(:user_registration_form) { UserRegistrationForm.new(name: 'Rob', phone: '000', dob: '12/12/1212') }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :phone }
  end

  describe '#name_is_unique' do
    it 'is validated uniquness of the name' do
      first_user = UserRegistrationForm.new(name: 'Bob', phone: '001', dob: '12/12/1212')
      expect(first_user).to be_valid

      first_user.save
      duplicate_user = UserRegistrationForm.new(name: 'Bob', phone: '122', dob: '12/12/1212')
      expect(duplicate_user).not_to be_valid
    end

    it 'is validated uniquness case insensitive' do
      first_user = UserRegistrationForm.new(name: 'BoB', phone: '111', dob: '12/12/1212').save
      duplicate_user = UserRegistrationForm.new(name: 'bob', phone: '122', dob: '12/12/1212')
      expect(duplicate_user).not_to be_valid
    end
  end

  describe '#dob_is_a_date' do
    it 'is returns error if date is invalid' do
      invalid_date = UserRegistrationForm.new(name: 'Bob', phone: '111', dob: 'not a date')
      expect(invalid_date).not_to be_valid
    end

    it 'is allows any valid date' do
      invalid_date = UserRegistrationForm.new(name: 'Bob', phone: '111', dob: '12/12/2000')
      expect(invalid_date).to be_valid
    end
  end
end
