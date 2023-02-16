require 'rails_helper'

RSpec.describe Group, type: :model do

  subject do
    @user1 = User.create(id: 1, name: 'test', email: 'test@test.com', password: '123456', confirmed_at: Time.now.utc)
    Group.create(name: 'luxury', icon: nil, user_id: @user1.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
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
