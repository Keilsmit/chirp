class PostsController < ApplicationController

before_action :require_login, only: [:new, :create]

  def index
    if current_user
      @posts = Post.timeline(current_user)
    else
      @posts = Post.all
    end
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end



  def create
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        render json: @post
      else
        render json: @user.errors.full_messages, status: 422
      end
  end




private

def post_params
  params.require(:post).permit(:body, :user_id)
end

end
