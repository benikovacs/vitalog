class SessionsController < ApplicationController

def new
end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id #this allows the user to remain signed in in the session
        flash[:notice] = "Login successful"
        redirect_to workouts_path

        else
            flash.now[:alert] = "incorrect login details"
            render 'new'
            
        end
end

def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
end

end
