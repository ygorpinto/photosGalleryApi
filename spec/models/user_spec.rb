RSpec.describe 'User' do
    it 'shold be not save nil' do
      expect {User.create(nil,nil)}.to raise_error
    end
end