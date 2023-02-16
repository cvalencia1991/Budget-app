require 'rails_helper'

RSpec.describe 'Users', type: :request do

  before(:each) do
    @user = User.new(name: 'cesar', email: 'cesar4a6z@gmail.com', password: '123456', password_confirmation: '123456')
    @user.skip_confirmation!
    @user.confirm
    @user.save
    sign_in @user
    @group1 = Group.create(id:1 , name: 'luxury', icon: nil, user_id:@user.id)
    Payment.create(id: 1, name: 'test', amount: 1000, group_id: @group1.id, user_id:  @user.id)
  end

  describe 'GET payments#create' do
    it 'returns a success response' do
      get  '/payments/new'
      expect(response).to be_successful
    end
  end

  describe 'GET payments#index' do
    it 'returns a success response' do
      get  '/payments'
      expect(response).to be_successful
    end
  end

  describe 'GET payments#show' do
    it 'returns a success response' do
      get  '/payments/1'
      expect(response).to be_successful
    end
  end


end
