class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
    end

    def profile
        @user = current_user
    end

    def profupdate
        @user = current_user
        @user.update(params.require(:user).permit(:name, :email))
        redirect_to "/"
    end


end
