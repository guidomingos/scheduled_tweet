class UsersController < ApplicationController  
    def index
        @users = User.all
    end
   
    def edit
        @user = User.find(params[:id])
    end

    def list
        @users = User.all
    end

    def destroy
        @user = User.find_by_id(params[:id])
        if @user.id == Current.user.id
            redirect_to users_path, alert: "You can't delete yourself."
        else 
            @user.destroy
            redirect_to users_path, notice: "User deleted successfully."
        end
    end 

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
          redirect_to users_path, notice: 'Successfully updated the user'
        else
          flash[:alert] = 'Invalid email or password'
          render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end