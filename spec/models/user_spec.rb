require 'spec_helper'

describe User, 'Factory' do
  subject { build :user }

  it { should be_valid }
end


describe User do

  describe 'Validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :name}
    it {should validate_presence_of :password}
    it {should allow_value("email@address.com").for(:email)}
    it {should_not allow_value("foo").for(:email)}

    describe 'email uniqueness' do
      let!(:user1) {create :user, email: 'e@e.com'}

      it 'is invalid if email already exists' do
        (build :user, email: "E@E.CoM").should_not be_valid
      end
    end
  end

  describe 'set_token' do
    let(:user) {create :user}
    it 'should set the token to a random string' do
      user.token.should be_a(String)
    end
  end


  
end
