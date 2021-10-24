require "rails_helper"
RSpec.describe 'UsersController', :type => :request do
    let(:user) {User.create(email:"teste@teste",password:"12345678")}
    it 'should create some user' do
      post '/users', :params => {:email => 'test@teste.com.br', :password => '12345678'}
      expect(response).to have_http_status(204)
    end
    it 'should update the user' do
        put '/users', :params => {:id => 1, :email => 'test@teste.com.br', :password => '12345678'}
        expect(response).to have_http_status(204)
    end
    it 'the user as been changed' do
        put '/users', :params => {:id => 1, :email => 'teste@teste', :password => '12345678'}
        expect(user[:email]).to eq('teste@teste')
    end
end