class ApplicationController < ActionController::Base

    def private_access
        redirect_to user_session_path unless signed_in?        
    end

    def is_user?
        @post = Post.find(params[:id])    
        unless current_user.id == @post.user_id    
          flash[:alert] = "Usuario no tienes permisos."
    
          redirect_to posts_path    
        end    
    end

end
