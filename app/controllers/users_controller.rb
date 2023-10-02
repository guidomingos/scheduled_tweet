class UsersController < ApplicationController 
    def index
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
        if Current.user.update(user_params)
            redirect_to root_path, notice: "Registration data updated!"
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end