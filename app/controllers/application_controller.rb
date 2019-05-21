class ApplicationController < ActionController::Base

    def private_access
        redirect_to user_session_path unless signed_in?
        
    end

end
