require "rails_helper"

RSpec.describe  "Groups", type: :model do
  subject do
    User.create(id: 1, name: 'cesar', email: 'cesar@4a6z.com', password: '123456', confirmed_at: Time.now.utc)
    Group.create(id: 1, name: 'luxury', icon: 'icon_1', user_id: User.first.id)
  end
  it 'is a group valid' do
    expect(subject).to be_valid
  end

  # it 'is not valid without a name' do
  #   subject.name = nil
  #   expect(subject).to_not be_valid
  # end

  # it 'is not valid without a email' do
  #   subject.email = nil
  #   expect(subject).to_not be_valid
  # end

end
