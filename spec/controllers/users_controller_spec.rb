require 'spec_helper'

describe UsersController do

  describe 'POST create' do
    context 'with all correct params set' do
      before do 
        params = {name: "John Doe", email: "john@doe.com", password: "s3kr3t", password_confirmation: "s3kr3t"}
        post :create, params, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      end

      it { should respond_with :created }
      it { should render_template 'builders/user' }

      it 'should have the correct content' do
        expected = {id: assigns[:user].id, name: "John Doe", email: "john@doe.com", authentication_token: "#{assigns[:user].token}"}.to_json
        response.body.should  == expected
      end 
    end

    context 'with incorrect params' do
      before do 
        params = {name: "John Doe", email: "john@doe.com"}
        post :create, params, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
      
      end

      it {should respond_with 422}

    end
  end


end
