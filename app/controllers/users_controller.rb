class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [ :edit, :update, :index]
    before_action :require_same_user, only: [:edit, :update, :index]

    def show
      
        @workouts = @user.workouts
    end

    def index
        @users = User.all
    
    end

    def new
        @user = User.new
    end

    def edit
      
    end

    def update

        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated #{@user.username}."
            redirect_to users_path
        else
            render 'edit'
        end

    end


    def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id #this allows for logged in after signup
                flash[:notice] = "Welcome to VitaLog #{@user.username}, signup successful"
                redirect_to workouts_path
            else
                render 'new'
            end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
     
      end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
          flash[:alert] = "you can only access your own profile"
          redirect_to root_path
        end
      end


end


