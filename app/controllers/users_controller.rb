class UsersController < ApplicationController
    def index
        @users = User.all
        @rooms = Room.all
    end
    
    def show
        @user = User.find_by(id: params[:id])
        @room = Room.new
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
