class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] #it checks whether the session already has a user, if not then it checks the database
    end

    def logged_in? #to check if the user is logged in
        !!current_user #!! turns current user into a boolean
    end

    def require_user
        if !logged_in?
            flash[:alert] = "you must be logged in to perform that action"
            redirect_to login_path    
        end
    end



end
