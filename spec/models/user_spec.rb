require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Bob', phone: '00000') }

  describe 'a valid user' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :dob }
  end
end
