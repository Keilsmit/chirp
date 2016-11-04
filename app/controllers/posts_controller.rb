class PostsController < ApplicationController

before_action :require_login, only: [:new, :create]

  def index
    if current_user
      @posts = Post.timeline(current_user).order(created_at: :desc)
    else
      
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end


  def create(post_params)
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def body
    @post = Post.find(params[:id])
  end


private

def post_params
  params.require(:post).permit(:body)
end

end
