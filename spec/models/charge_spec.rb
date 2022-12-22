require 'rails_helper'

RSpec.describe Charge, type: :model do
  let(:user) do
    User.create(
      name: 'John',
      email: 'john1@gmail.com',
      password: '1234567'
    )
  end

  subject do
    Charge.new(
      name: 'Rica sauce',
      amount: 100,
      author_id: user.id
    )
  end

  before { subject.save }

  describe 'valid attributes' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user_id' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end
  end
end
