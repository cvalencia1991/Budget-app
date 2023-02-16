require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { @user1 = User.create(name: 'John', email: 'john@example.com', password: 'password123') }
  @user1.skip_confirmation!
  @user1.save
  subject { described_class.new(name: 'Test Group', user:) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a user' do
    expect(subject).to respond_to(:user)
  end

  it 'has many transactions' do
    expect(subject).to respond_to(:transactions)
  end

  it 'can have an icon attached' do
    expect(subject).to respond_to(:icon)
  end
end
