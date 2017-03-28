class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id]) 
    end
    
    def index
        @users = User.all 
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        if @user.destroy
           redirect_to root_path, notice: "User has been successfully deleted."
        end   
    end
end
