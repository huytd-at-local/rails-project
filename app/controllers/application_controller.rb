class ApplicationController < ActionController::Base
    before_action :authenticate_user

    def authenticate_user
        if session[:user_id]
            @current_user = User.find_by(id: session[:user_id])
        end
    end

    def ensure_login
        if session[:user_id] = nil
            flash[:notice] = "you have to login"
            redirect_to "/login"
        end
    end

    def ensure_logout
        if session[:user_id] != nil
            flash[:notice] = "you're already login"
            redirect_to "/posts/index"
        end
    end
end
