class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user 
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        else
            require_login()
        end
    end

    private

    def require_login 
        redirect_to "/sign_up"
    end
    
end
