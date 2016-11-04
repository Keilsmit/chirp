class UsersController < ApplicationController


  def signin
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      render json: @user
    else
      render json: ["Credentials did not match"], status: :unauthenticate
    end
  end


  def create
    @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: @user.errors.full_messages
      end
  end


  private

   def user_params
     params.permit(:email, :password, :avatar)
   end


end
