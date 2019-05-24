class PostsController < ApplicationController
  before_action :private_access, except: [:index, :show]
  
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def new
    @post = Post.new
    @post.user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user =  current_user
    if @post.save
      flash[:notice] = "Post creado correctamente"
      redirect_to root_path
    else
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
    
    if @post.update(post_params)
      flash[:notice] = "Post actualizado correctamente"
      redirect_to root_path
    else
      render :edit
    end
    
  end

  def destroy
    post = Post.find(params[:id])
    post.user = current_user
    post.destroy
    flash[:notice] = "Post eliminado correctamente"

    redirect_to root_path    
  end



  private

  def post_params
    params.require(:post).permit(:user_id, :title, :image, :content)
  end

  
end
