class SessionsController < ApplicationController
    skip_before_action :set_current_user

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "", notice: "Logged in!"
        else
            redirect_to "/sign_in", notice: "Invalid email or password!"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/", notice: "Logged out"
    end
end
