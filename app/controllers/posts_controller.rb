class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :move_to_login, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :category_id,
      :prefecture_id,
      :url
    ).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
