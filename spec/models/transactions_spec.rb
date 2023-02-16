require 'rails_helper'

RSpec.describe 'Payments', type: :model do
  subject do
    @user1 = User.create(id: 1, name: 'test', email: 'test@test.com', password: '123456', confirmed_at: Time.now.utc)
    @group1 = Group.create(id:1 , name: 'luxury', icon: nil, user_id:@user1.id)
    Payment.create(id: 1, name: 'test', amount: 1000, group_id: @group1.id, user_id:  @user1.id)
  end

  it 'is a transaction valid' do
    expect(subject).to be_valid
  end

  it 'is a transaction invalid' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
