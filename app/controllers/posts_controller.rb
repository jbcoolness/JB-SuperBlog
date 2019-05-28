class PostsController < ApplicationController
  before_action :private_access, except: [:index, :show]
  before_action :is_user?, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  
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

  end

  def edit
    
  end

  
  def update    
    
    if @post.update(post_params)
      flash[:notice] = "Post actualizado correctamente"
      redirect_to root_path
    else
      render :edit
    end
    
  end

  def destroy
    post.destroy
    flash[:notice] = "Post eliminado correctamente"

    redirect_to root_path    
  end



  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :image, :content)
  end

  
end
