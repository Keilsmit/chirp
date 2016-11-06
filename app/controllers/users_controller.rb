class UsersController < ApplicationController

before_action :require_login, only: [:my_posts]


  def all
    @user = User.all
    render json: @user
  end

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
    @posts = current_user.posts.order("created_at DESC")
    render json: @posts
  end

  def followees
    @followees = current_user.followees(User)
    render json: @followees
  end



  private

   def user_params
     params.permit(:email, :password, :avatar, :name)
   end


end
