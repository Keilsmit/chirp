class UsersController < ApplicationController

before_action :require_login, only: [:my_posts]

  def signin
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
      if @user.present?
        render json: @user
      else
        render json: ["User not found"]
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



  def follow
    current_user.toggle_follow!(User.find(params[:id]))
    render json: current_user
  end

  def my_posts
    @posts = current_user.posts
    render json: @posts
  end



  private

   def user_params
     params.permit(:email, :password, :avatar, :name)
   end


end
