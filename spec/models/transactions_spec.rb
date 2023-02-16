require "rails_helper"

RSpec.describe  "Payments", type: :model do

    subject do
      @user1 = User.create(id: 1, name: 'cesar', email: 'cesar4a6z@gmail.com', password: '123456',encrypted_password:'$2a$12$1Y2/Xvi3N/zUIyZilGVHQ.4iTG0PDE8gp3pn6jgpL0TgR0xi8Aegq')
      @user1.skip_confirmation!
      @user1.save
      Group.create(name: 'luxury', icon: nil, user_id: 1)
      Payment.create(id: 1, name:'test',  amount: 1000,group_id: 1, user_id: 1)
    end

    it 'is a transaction valid' do
      expect(subject).to be_valid
    end

    it 'is a transaction invalid' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
end
