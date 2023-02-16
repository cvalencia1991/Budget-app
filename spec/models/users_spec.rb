require "rails_helper"

RSpec.describe  "Users", type: :model do
  subject do
    User.create(id: 1, name: 'cesar', email: 'cesar@4a6z.com', password: '123456', confirmed_at: Time.now.utc)
  end
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "has many groups" do
    expect(subject).to respond_to(:groups)
  end

  it "has many transactions" do
    expect(subject).to respond_to(:transactions)
  end

end
