
require 'rails_helper'

RSpec.describe 'Users', type: :request do

  before(:each) do
    @user = User.new(name: 'cesar', email: 'cesar@4a6z.com', password: '123456', password_confirmation: '123456')
    @user.skip_confirmation!
    @user.confirm
    @user.save
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get  '/users'
      expect(response).to be_successful
    end
  end

end
