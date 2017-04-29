class UsersController < ApplicationController
    before_filter :authenticate_user!

    
    def show
        @user = User.find(params[:id]) 
    end
    
    def index
        @users = User.paginate(:page => params[:page], :per_page => 5) 
    end
    
    def import
        User.import(params[:file])
        redirect_to :back, notice: "Users were successfully imported"
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        if @user.destroy
           redirect_to root_path, notice: "User was successfully deleted."
        end   
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
   def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to users_path, notice: "User was successfully updated."
        else
            format.html { render :edit }
        end
   end
    
    def user_params
        params.require(:user).permit(:name, :email, :faculty, :administrator)
    end
end
