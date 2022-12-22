require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John',
      email: 'john1@gmail.com',
      password: '1234567'
    )
  end

  before { subject.save }

  describe 'valid attributes' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many Categories' do
      assc = described_class.reflect_on_association(:groups)
      expect(assc.macro).to eq :has_many
    end

    it 'has many Expenses' do
      assc = described_class.reflect_on_association(:charges)
      expect(assc.macro).to eq :has_many
    end
  end
end
