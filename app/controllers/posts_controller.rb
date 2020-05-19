class PostsController < ApplicationController
  before_action :authorized
  
  def index
    #fetch all the posts
    #first the posts should be sorted according to the deadline
    @posts = Post.paginate(page: params[:page]).order([:created_at]).reverse_order
    @post = Post.new
  end

  def show
    #to show a Post
    @post = Post.find(params[:id])
  end

  def create
    #create a new Post
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @posts = Post.paginate(page: params[:page]).order([:created_at]).reverse_order
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    #update an existing Post
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    #destory an existing Post
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
