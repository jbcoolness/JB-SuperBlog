class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user =  current_user
    if @post.save
      flash[:notice] = "Post Creado"
      redirect_to root_path
    else
      flash[:notice] = "Error, intente nuevamente"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @post.user = current_user
  end

  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    @post.update(post_params)

    redirect_to root_path
  end



  private

  def post_params
    params.require(:post).permit(:user_id, :title, :image, :content)
  end

  
end
