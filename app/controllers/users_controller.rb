class UsersController < ApplicationController

respond_to :json

  def create

    @user = User.new(user_params)

    if @user.save
      render 'builders/user', locals: {user: @user}, status: 201
    else
      render json: @user.errors, status: 422
    end

  end



private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end